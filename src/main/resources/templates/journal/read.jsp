<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-4 text-gray-800">저널 상세보기</h1>
	<input type="hidden" class="form-control form-control-user" name="jNo" value="${dto.JNo}">
	
      <div class="form-group row">
      	<c:if test="${not empty dto.imageDTO && dto.imageDTO.IName!='' }">
      	<a href="/image/show?imagePath=${dto.imageDTO.imagePath }">      	
		<img src="/image/show?imagePath=${dto.imageDTO.thumbnailPath }">
		<p>크게보기</p>
		</a>
	  	</c:if>
	  </div>
	  
	  <div class="row">
		  <div class="col-xl-4 col-md-6 mb-4">
			<div class="card border-left-primary shadow h-100 py-2">
				<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">작성자</h6>
		  		</div>
		  		<div class="card-body">
					<div class="row no-gutters align-items-center">
					<div class="col mr-2">
	
					<div class="h2 mb-0 font-weight-bold text-gray-800 my-3"></div>
					</div>
					</div>
					${dto.MEmail }
					<img src="/resources/imgs/user-solid.svg" style='width: 40px; float: right; margin-right: 20px'>
				</div>
		  	</div>
		  </div>
	  
		  <div class="col-xl-4 col-md-6 mb-4">
			<div class="card border-left-primary shadow h-100 py-2">
				<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">내용</h6>
		  		</div>
		  		<div class="card-body">
					<div class="row no-gutters align-items-center">
					<div class="col mr-2">
	
					<div class="h2 mb-0 font-weight-bold text-gray-800 my-3"></div>
					</div>
					</div>
					${dto.JContent }
					<img src="/resources/imgs/edit-solid.svg" style='width: 40px; float: right; margin-right: 20px'>
				</div>
		  	</div>
		  </div>
	 </div>
	 
	 <div class="row"> 
		  <div class="col-xl-4 col-md-6 mb-4">
			<div class="card border-left-primary shadow h-100 py-2">
				<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">좋아요</h6>
		  		</div>
		  		<div class="card-body">
					<div class="row no-gutters align-items-center">
					<div class="col mr-2">
	
					<div class="h2 mb-0 font-weight-bold text-gray-800 my-3"></div>
					</div>
					</div>
					${dto.LCnt }
					<img src="/resources/imgs/heart1.svg" style='width: 40px; float: right; margin-right: 20px'>
				</div>
		  	</div>
		  </div>
		  
		  <div class="col-xl-4 col-md-6 mb-4">
			<div class="card border-left-primary shadow h-100 py-2">
				<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">날짜</h6>
		  		</div>
		  		<div class="card-body">
					<div class="row no-gutters align-items-center">
					<div class="col mr-2">
	
					<div class="h2 mb-0 font-weight-bold text-gray-800 my-3"></div>
					</div>
					</div>
					<fmt:formatDate pattern="yyyy-MM-dd" value="${dto.JDate}" />
					<img src="/resources/imgs/calendar-alt-regular.svg" style='width: 40px; float: right; margin-right: 20px'>
				</div>
		  	</div>
		  </div>
	  </div>
      
		<a href="/journal/mylist" class="btn btn-secondary">
            <span class="text">목록보기</span>
        </a>
   
<sec:authorize access="isAuthenticated()">
 	<sec:authentication property="principal.memberDTO.mGrade" var="loginUserRole"/> 
	<sec:authentication property="principal.memberDTO.mEmail" var="loginUser" />		
	<c:if test="${loginUser eq dto.MEmail || loginUserRole eq 'ADMIN'}">
      <a href='/journal/modify?jNo=${dto.JNo}' class="btn btn-warning">
        	<span class="text">수정/삭제</span>
      </a>
    </c:if>
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
	var msg = '${msg}';
	console.log("msg>>",msg);
	if (!(msg===''||history.state)){
		var modal= $(".modal");
		console.log(modal);	
		modal.modal();
	}
	
});
	
</script>
<%@ include file="../include/footer.jsp"%>
