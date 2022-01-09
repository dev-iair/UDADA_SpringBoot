<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!-- Begin Page Content -->
<div class="container">
	<div class="row justify-content-center" style="display: flex; align-items: center; min-height: 500px;">
		<div class="col-xl-5 col-lg-5 col-md-5">
	<!-- Page Heading -->
			<h1 class="h3 mb-4 text-gray-800">내 정보 입력하기</h1>
		
			<form action="/member/joinForm_step2" method="post" id="memfrm" class="user">
			
				<input type="hidden" name="mEmail" id="mEmail" class="form-control form-control-user" value="${mEmail }">
				<div class="form-group row">
					<label>키</label>
					<input type="text" name="msHeight" id="msHeight" class="form-control form-control-user" required>
				</div>
				<div class="form-group row">
					<label>현재 체중</label>
					<input type="text" name="msWeight" id="msWeight" class="form-control form-control-user" required>
				</div>
				<div class="form-group row">
					<label>목표 체중</label>
					<input type="text" name="msGoal" id="msGoal" class="form-control form-control-user" required>
				</div>
				<div class="form-group row">
					<input type="submit" id="submit" name="submit" class="btn btn-facebook btn-block" style="border-radius: 30px;" value="가입하기">
				</div>
				<div class="form-group row">
					<input type="button" id="cancel" name ="cancel" class="btn btn-google btn-block" style="border-radius: 30px;" value="취소">
				</div>
			</form>
		</div>
	</div>
</div>
<script>
	$(document).ready(function(){
		$("#cancel").on("click", function(){
			location.href="/member/login";
		})
		
		$("#submit").on("click", function(){
			if($("#msHeight").val() == ""){
				alert("키를 입력해주세요.");
				$("#msHeight").focus();
				return false;
			}
			
			if($("#msWeight").val() == ""){
				alert("현재 체중을 입력해주세요.");
				$("#msWeight").focus();
				return false;
			}
			
			if($("#msGoal").val() == ""){
				alert("목표체중을 입력해주세요.");
				$("#msGoal").focus();
				return false;
			}
			
			
		})
	})
	
</script>

<!-- /.container-fluid -->
</div>
<!-- End of Main Content -->
<%@ include file="../include/footer.jsp"%>
