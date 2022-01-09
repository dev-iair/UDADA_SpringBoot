<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>

<!-- Begin Page Content -->
<div class="container">
	<div class="row justify-content-center" style="display: flex; align-items: center; min-height: 500px;">
		<div class="col-xl-5 col-lg-5 col-md-5">

	<!-- Page Heading -->
			<h1 class="h3 mb-4 text-gray-800">회원가입</h1>
		
			<form action="/member/emailCheckProc" method="post" id="memfrm" class="user">
				<div class="form-group">
					<label>이메일</label>
					<input type="text" name="mEmail" id="mEmail" class="form-control form-control-user">
				</div>
				<div class="form-group">
					<button type="button" value="N" id="emailCheckBtn" name="emailCheckBtn" class="btn btn-facebook btn-block" style="border-radius: 30px;" onclick="emailCheck()">이메일중복확인</button>
				</div>
				<div class="form-group">
					<label>이름</label>
					<input type="text" name="mName" id="mName" class="form-control form-control-user" required>
				</div>
				<div class="form-group">
					<label>비밀번호</label>
					<input type="password" name="mPw" id="mPw" class="form-control form-control-user" required>
				</div>
				<div class="form-group">
					<label>비밀번호 확인</label>
					<input type="password" name="mPw2" id="mPw2" class="form-control form-control-user" required>
				</div>
				<div class="form-group">
					<label>생년월일</label>
					<input type="text" name="mBirthStr" id="mBirthStr" class="form-control form-control-user selector" required>
				</div>
				<div class="form-group">
					<label>성별</label>
				</div>
				
				<div class="form-group">
					<input type="radio" name="mGender" id="mGender" value="M">남자&emsp;&emsp;
					<input type="radio" name="mGender" id="mGender" value="F">여자
				</div>
				<hr>
				<div class="form-group">
					<label>선호식단</label>
				</div>
				<div class="form-group">
					<input type="radio" name="mMeal" id="mMeal" value="VEG">VEG&emsp;&emsp;
					<input type="radio" name="mMeal" id="mMeal" value="KETO">KETO&emsp;&emsp;
					<input type="radio" name="mMeal" id="mMeal" value="MEDT">MEDT&emsp;&emsp;
					<input type="radio" name="mMeal" id="mMeal" value="NORMAL">NORMAL&emsp;&emsp;
				</div>
				<hr>
				<div class="form-group">
					<label>다이어트 목표</label>
				</div>
				<div>
					<select name="mGoaltype" id="mGoaltype" style="width:100%;">
						<option value="느린체중 감소">느린체중 감소</option>
						<option value="느린체중 증가">느린체중 증가</option>
						<option value="현재체중 유지">현재체중 유지</option>
						<option value="체중감소">체중감소</option>
						<option value="체중증가">체중증가</option>
					</select>
				</div>
				<hr>
					<input type="hidden" name="mGrade" id="mGrade" value="USER">
				<div class="form-group">
					<input type="submit" id="submit" name="submit" class="btn btn-facebook btn-block" style="border-radius: 30px;" value="다음단계">
				</div>
				<div class="form-group">
					<input type="button" id="cancel" name ="cancel" class="btn btn-google btn-block" style="border-radius: 30px;" value="취소">
				</div>
			</form>
		</div>
	</div>
<!-- /.container-fluid -->
</div>
<script>

	flatpickr.localize(flatpickr.l10ns.ko);
	
	$(".selector").flatpickr(
		{
			   dateFormat: "Y-m-d",
		}
	);

	$(document).ready(function(){
		$("#cancel").on("click", function(){
			location.href="/member/login";
		})
		
		$("#submit").on("click", function(){
			if($("#mEmail").val() == ""){
				alert("이메일을 입력해주세요.");
				$("#mEmail").focus();
				return false;
			}
			
			if($("#mName").val() == ""){
				alert("이름을 입력해주세요.")
				$("#mName").focus();
				return false;
			}
			
			if($("#mPw").val() == ""){
				alert("비밀번호를 입력해주세요.")
				$("#mPw").focus();
				return false;
			}
			if($("#mPw2").val() == ""){
				alert("비밀번호를 입력해주세요.")
				$("#mPw2").focus();
				return false;
			}
			
			if($("#mPw").val() != $("#mPw2").val()){
				alert("비밀번호가 일치하지 않습니다.");
				$("#mPw2").focus();
				return false;
			}
			
			if($("#mBirth").val() == ""){
				alert("생년월일을 입력해주세요.")
				$("#mBirth").focus();
				return false;
			}
			
			var emailChkVal = $("#emailCheckBtn").val();
			if(emailChkVal == "N"){
				alert("중복확인 버튼을 눌러주세요.")
				return false;
			}else if(emailChkVal == "Y"){
				$("#memfrm").submit();
			}
		})
	})
	
	function ECheck(email){
		var regex=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		return (email != '' && email != 'undefined' && regex.test(email));
	}//ECheck() end

	function emailCheck(){
		
		
		if(! (ECheck($("#mEmail").val()))){
			alert("올바른 이메일을 입력해주세요.");
			return false;
		}
		
		$.ajax({
			url : "/member/emailChk",
			type : "post",
			data : {"mEmail" : $("#mEmail").val()},
			success : function(data){
				console.log(data);

				if(data =='success'){

					$("#emailCheckBtn").attr("value", "Y");
					alert("사용 가능한 아이디 입니다.");
					}else{
						alert("중복된 아이디 입니다.");
						return false;
						}
				/* if(data == 1){
					alert("중복된 아이디 입니다.");
				}else if(data == 0){
					$("#emailCheckBtn").attr("value", "Y");
					alert("사용 가능한 아이디 입니다.");
				} */
			}
		})
	}
</script>
</div>
<!-- End of Main Content -->
<%@ include file="../include/footer.jsp"%>
