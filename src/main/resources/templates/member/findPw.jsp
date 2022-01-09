<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->

            <div class="col-xl-10 col-lg-12 col-md-9" style="margin:0 auto; ">
                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block"><img src="/resources/imgs/login-salad.svg"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">비밀번호 찾기</h1>
                                        <p class="mb-4" style="color:lightgray;">가입한 이메일을 입력하시면 해당 이메일로 임시 비밀번호를 전송해드립니다.</p>
                                    </div>
                                    <form class="user" action="/member/findPw" method="post">
                                        <div class="form-group">
                                            <input type="email" class="form-control form-control-user"
                                                id="mEmail" name="mEmail" aria-describedby="emailHelp"
                                                placeholder="이메일 주소">
                                             <div id="error" name="error" class="form-group" style="display:none; color:red;">유효하지 않은 이메일주소 입니다.</div>
                                        </div>
                                        <button type="submit" id="findPwd" name="findPwd"  class="btn btn-primary btn-user btn-block" onclick="return checkPwd()">비밀번호 찾기</button>
                                    </form>
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" href="/member/joinForm">회원가입 하기</a>
                                    </div>
                                    <div class="text-center">
                                        <a class="small" href="/member/login">로그인 하기</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

<script>
	$(document).ready(function() {
		var msg = '${msg}';
		
		if (!(msg===''||history.state)){
			var modal= $(".modal");
			modal.modal();
		}
	});	
	
	function ECheck(mEmail){
		var regex = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		return mEmail != '' && mEmail != 'undefined' && regex.test(mEmail);
	}
	
	function checkPwd(){
		
		var mEmail = $("#mEmail").val();
		mEmail = mEmail.trim();
		
		if(! ECheck(mEmail)){
			$("#error").show();
			$("#mEmail").focus();
			return false;
		}else{
			$("#error").hide();
			return true;
		}
	
}

</script>
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
<!-- /.container-fluid -->
</div>
<!-- End of Main Content -->
<%@ include file="../include/footer.jsp"%>
