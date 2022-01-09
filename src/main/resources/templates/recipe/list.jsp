<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<!-- Begin Page Content -->
<div class="container-fluid">

	
<!-- Page Heading -->
	<div class="row">
		<div class="col-lg-12">
			<div class="card mb-4 py-3">
				<div class="card-body">
					<h1 class="h3 mb-4 text-gray-800">
						<a href="/recipe/list">레시피 탐색하기</a>
					</h1>
					<a href="/recipe/register" class="btn btn-primary"> 
						<span class="text">등록하기</span>
					</a>

					<!-- Topbar Search -->
					<form action="/recipe/list" method="GET" id="searchForm"
						class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
						<input type="hidden" class="form-control form-control-user"
							name="pageNum" value=${pageResultDTO.pageRequestDTO.pageNum }>

						<div class="input-group">
							<input type="text" class="form-control bg-light border- small" name="keyword" value="${pageRequestDTO.keyword }"
								placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
							<div class="input-group-append">
								<button class="btn btn-primary searchBtn" type="button">
									<i class="fas fa-search fa-sm"></i>
								</button>
							</div>
						</div>
					</form>


				</div>
			</div>
		</div>
	</div>



	<c:forEach var="dto" items="${list}">
		<div class="card mb-3">
			<div class="card border-left-primary shadow h-100 py-2 px-2">
				<div class="row g-0">
					<div class="col-auto">
						<c:if test="${not empty dto.imageDTO && dto.imageDTO.IName!='' }">
							<img src="/image/show?imagePath=${dto.imageDTO.thumbnailPath }">
						</c:if>
					</div>
					<div class="col">
						<div class="card-body">
							<h5 class="card-title">
								<a
									href='/recipe/read?rNo=<c:out value="${dto.RNo}"/>&pageNum=${pageResultDTO.pageRequestDTO.pageNum}&keyword=${pageResultDTO.pageRequestDTO.keyword }'>
									<c:out value="${dto.RTitle}" />
									<c:if test="${ dto.replyCnt gt 0}">
									<span>---- [<c:out value="${dto.replyCnt}" />]</span>
									</c:if>
									
								</a>
							</h5>
							<p class="card-text">
								<small class="text-muted"><c:out value="${dto.MEmail}"></c:out></small>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>

        
		<nav>
		  <ul class="pagination">
		    <li class="page-item ${pageResultDTO.prev ? "":'disabled' }">
		      <a class="page-link" href="/recipe/list?pageNum=${pageResultDTO.pageRequestDTO.pageNum-1}&keyword=${pageResultDTO.pageRequestDTO.keyword}" tabindex="-1" aria-disabled="true">Prev</a>
		    </li>
		    
		    <c:forEach var="page" begin="${pageResultDTO.start}" end="${pageResultDTO.end }">
		    	<li class="page-item ${page==pageResultDTO.pageRequestDTO.pageNum? 'active' : '' }">
		    		<a class="page-link" href="/recipe/list?pageNum=${page}&keyword=${pageResultDTO.pageRequestDTO.keyword}">
		    			<c:out value="${page}"/>
		    		</a>
		    	</li>
		    </c:forEach>
		   
		    <li class="page-item ${pageResultDTO.next ? "":'disabled' }">
		      <a class="page-link" href="/recipe/list?pageNum=${pageResultDTO.pageRequestDTO.pageNum+1}&keyword=${pageResultDTO.pageRequestDTO.keyword}">Next</a>
		    </li>
		  </ul>
		</nav>

</div>
<!-- /.container-fluid -->
</div>
<!-- End of Main Content -->
        <div class="modal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Result</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p>${msg }</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">Ok</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
<script>
$(document).ready(function(){

	var searchForm = $("#searchForm");
	var msg = '${msg}';
	console.log("msg>>",msg);

	$("#searchForm button").on("click",function(e){

		searchForm.find("input[name='pageNum']").val(1);
		searchForm.submit();		
		});

	if (!(msg===''||history.state)){
		var modal= $(".modal");
		console.log(modal);	
		modal.modal();
	}
});
	
</script>
<%@ include file="../include/footer.jsp"%>
