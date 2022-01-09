<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

<!-- Begin Page Content -->
<div class="container">

	<!-- Page Heading -->
<div class="row justify-content-center" style="display: flex; align-items: center; min-height: 500px;">
	<div class="col-xl-5 col-lg-5 col-md-5">
	<h1 class="h3 mb-4 text-gray-800">내 정보 수정</h1>

	<form action="/member/updateMyProfile" method="post" id="memfrm" name="memfrm" class="user">
	
		<div class="form-group">
			<label>이메일</label>
			<input type="text" name="mEmail" id="mEmail" class="form-control form-control-user" value ="${dto.MEmail}" readonly>
		</div>
		<div class="form-group">
			<label>이름</label>
			<input type="text" name="mName" id="mName" class="form-control form-control-user" value ="${dto.MName }" required>
		</div>
		<div class="form-group">
			<label>새 비밀번호</label>
			<input type="password" name="mPw" id="mPw" class="form-control form-control-user" placeholder="비밀번호 변경을 원하시면 입력하세요">
		</div>
		<div class="form-group">
			<label>새 비밀번호 확인</label>
			<input type="password" name="mPw2" id="mPw2" class="form-control form-control-user" placeholder="비밀번호 변경을 원하시면 입력하세요">
		</div>
		<div class="form-group">
			<label>생년월일</label>
			<input type="text" name="mBirthStr" id="mBirthStr" class="form-control form-control-user selector" value ="<fmt:formatDate value="${dto.MBirth}" pattern="yyyy-MM-dd" />" required>
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
		<div class="form-group">
			<select name="mGoaltype" id="mGoaltype" style="width:100%;">
				<option value="느린체중 감소">느린체중 감소</option>
				<option value="느린체중 증가">느린체중 증가</option>
				<option value="현재체중 유지">현재체중 유지</option>
				<option value="체중감소">체중감소</option>
				<option value="체중증가">체중증가</option>
			</select>
		</div>
		<hr>
		<input type="hidden" name="mGrade" id="mGrade" value="${dto.MGrade }">
		<div class="form-group">
			<input type="submit" id="update" name="update" class="btn btn-facebook btn-block" style="border-radius: 30px;" value="수정하기">
		</div>
		<div class="form-group">
			<input type="button" id="leave" name="leave" class="btn btn-google btn-block" style="border-radius: 30px;" value="탈퇴하기">
		</div>
		<div class="form-group">
			<input type="button" id="cancel" name ="cancel" class="btn btn-warning btn-block" style="border-radius: 30px;" value="취소">
		</div>
	</form>
	</div>
</div>
<!-- /.container-fluid -->

</div>
<script>

	flatpickr.localize(flatpickr.l10ns.ko);

	$(".selector").flatpickr({
		dateFormat : "Y-m-d",
	});

	$(document).ready(
			function() {
				
				var mMealVal = '${dto.MMeal}';
				$("input[name=mMeal]").filter(
						"input[value='" + mMealVal + "']").attr("checked", true);
				
				var mGenderVal = '${dto.MGender}';
				$("input[name=mGender]").filter(
						"input[value='" + mGenderVal + "']").attr("checked", true);
				
				var mGoaltypeVal = '${dto.MGoaltype}';
				$('#mGoaltype').val(mGoaltypeVal).prop("selected",true);
				

				$("#cancel").on("click", function() {
					location.href = "/";
				})

				$("#update").on("click", function() {

					if ($("#mName").val() == "") {
						alert("이름을 입력해주세요.")
						$("#mName").focus();
						return false;
					}

					if ($("#mPw").val() != "") {
						if ($("#mPw").val() != $("#mPw2").val()) {
							alert("비밀번호가 일치하지 않습니다.");
							$("#mPw2").focus();
							return false;
						}
					}

					if ($("#mBirthStr").val() == "") {
						alert("생년월일을 입력해주세요.")
						$("#mBirthStr").focus();
						return false;
					}

				})

				$("#leave").on("click", function() {
					if (confirm("정말 탈퇴하시겠습니까?")) {
						document.memfrm.action = "/member/leave";
						document.memfrm.submit();
					}

				})

			})

	$(document).ready(function() {
		var msg = '${msg}';
		console.log("msg>>", msg);
		if (!(msg === '' || history.state)) {
			var modal = $(".modal");
			console.log(modal);
			modal.modal();
		}
	});
</script>
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
</div>
<%@ include file="../include/footer.jsp"%>
