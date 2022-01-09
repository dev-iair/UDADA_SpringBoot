<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->

	
	<b style="color:#FF46C5"><c:out value="${error }"></c:out></b>
	<b><c:out value="${logout }"></c:out></b>

	<sec:authorize access="isAnonymous()">	
		<div class="col-xl-10 col-lg-12 col-md-9" style="margin:0 auto; ">
			<div class="card o-hidden border-0 shadow-lg my-5">
				<div class="card-body p-0">
					<!-- Nested Row within Card Body -->
					<div class="row">
						<div class="col-lg-6 d-none d-lg-block px-5 py-5"><img src="/resources/imgs/login-salad.svg"></div>
						<div class="col-lg-6">
							<div class="p-5">
								<div class="text-center">
									<h1 class="h4 text-gray-900 mb-4">환영합니다!</h1>
								</div>													
								<form class="user" action="/login" method="post">
									<div class="form-group">
										<input type="email" name="username" class="form-control form-control-user"
											placeholder="이메일 주소">
									</div>
									<div class="form-group">
										<input type="password" name="password" class="form-control form-control-user" placeholder="비밀번호">
									</div>
									<button type="submit" class="btn btn-primary btn-lg btn-block btn-user">로그인</button>						
								</form>
								<br>
								<div class="text-center">
                                     <a class="small" href="/member/joinForm">회원가입</a>
                                </div>
                                <div class="text-center">
                                     <a class="small" href="/member/findPw">비밀번호 찾기</a>
                                </div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</sec:authorize>

	<sec:authorize access="isAuthenticated()">
		<div class="col-xl-10 col-lg-12 col-md-9">
			<div class="card o-hidden border-0 shadow-lg my-5">
				<div class="card-body p-0">
					<!-- Nested Row within Card Body -->
					<div class="row">
						<div class="col-lg-6 d-none d-lg-block">
							<img src="/resources/imgs/login-salad.svg">
						</div>
						<div class="col-lg-6">
							<div class="p-5">
								<div class="text-center">
									<h1 class="h4 text-gray-900 mb-4">환영합니다!</h1>
								</div>
								<div class="text-center">
								<h3 class="h4 text-gray-900 mb-4">
									오늘 하루 어떠신가요?<b> <sec:authentication property="principal.memberDTO.mName" /></b> 님
								</h3>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</sec:authorize>


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
</div>
<script>
$(document).ready(function(){
	var msg = '${msg}';
	if (!(msg===''||history.state)){
		var modal= $(".modal");
		modal.modal();
	}
});
	
</script>
<!-- /.container-fluid -->
</div>
<!-- End of Main Content -->
<%@ include file="../include/footer.jsp"%>
