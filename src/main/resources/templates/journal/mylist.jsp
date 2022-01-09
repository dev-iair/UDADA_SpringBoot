<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- Begin Page Content -->
<div class="container-fluid">
<sec:authorize access="isAuthenticated()">
<sec:authentication property="principal.memberDTO.mGrade" var="loginUserRole"/>
<sec:authentication property="principal.memberDTO.mEmail" var="loginUser"/>

	<!-- Page Heading -->
	<h1 class="h3 mb-4 text-gray-800"></h1>
	
		<a href="/journal/register" class="btn btn-primary">
            <span class="text">저널등록</span>
        </a>
        <!-- Topbar Search -->
		<form action="/journal/mylist" method="GET" id="searchForm"
			class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
			<input type="hidden" class="form-control form-control-user" name="pageNum" value=${pageResultDTO.pageRequestDTO.pageNum }>
			<input type="hidden" value="${loginUser }">
			
			<div class="input-group">
				<input type="text" class="form-control bg-light border- small" name="keyword" value="${pageRequestDTO.keyword }"
					placeholder="Search for..." aria-label="Search"
					aria-describedby="basic-addon2">
				<div class="input-group-append">
					<button class="btn btn-primary searchBtn" type="button">
						<i class="fas fa-search fa-sm"></i>
					</button>
				</div>
			</div>
		</form>
        
        <div class="card-body">
            <div class="table-responsive">
               
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" style="table-layout: fixed">
                    <thead>
                    <tr>
                        <th  scope="col" width="68%" style="text-align: center">내용</th>
                        <th  scope="col" width="7%" style="text-align: center">좋아요</th>
                        <th  scope="col" width="25%" style="text-align: center">작성일</th>
                    </tr>
                    </thead>
                    <tbody>

					<c:forEach var="dto" items="${mylist}">
						<tr>
							<td style="overflow:hidden;text-overflow:ellipsis"><a href='/journal/read?jNo=<c:out value="${dto.JNo}"/>'><c:out value="${dto.JContent}"></c:out></a></td>
							<td style="text-align: center">${dto.LCnt }</td>
							<td style="text-align: center"><fmt:formatDate pattern="yyyy-MM-dd" value="${dto.JDate}" /></td>
						</tr>
					</c:forEach>
				</tbody>
                </table>
            </div>
        </div>

		<nav>
		  <ul class="pagination">
		    <li class="page-item ${pageResultDTO.prev ? "":'disabled' }">
		      <a class="page-link" href="/journal/mylist?pageNum=${pageResultDTO.pageRequestDTO.pageNum-1}&keyword=${pageResultDTO.pageRequestDTO.keyword}" tabindex="-1" aria-disabled="true">Prev</a>
		    </li>
		    
		    <c:forEach var="page" begin="${pageResultDTO.start}" end="${pageResultDTO.end }">
		    	<li class="page-item ${page==pageResultDTO.pageRequestDTO.pageNum? 'active' : '' }">
		    		<a class="page-link" href="/journal/mylist?pageNum=${page}&keyword=${pageResultDTO.pageRequestDTO.keyword}">
		    			<c:out value="${page}"/>
		    		</a>
		    	</li>
		    </c:forEach>
		   
		    <li class="page-item ${pageResultDTO.next ? "":'disabled' }">
		      <a class="page-link" href="/journal/mylist?pageNum=${pageResultDTO.pageRequestDTO.pageNum+1}&keyword=${pageResultDTO.pageRequestDTO.keyword}">Next</a>
		    </li>
		  </ul>
		</nav>

</sec:authorize>
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
