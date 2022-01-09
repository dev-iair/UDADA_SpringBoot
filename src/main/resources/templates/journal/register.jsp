<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!-- Begin Page Content -->
<div class="container-fluid">
<sec:authorize access="isAuthenticated()">
<sec:authentication property="principal.memberDTO.mGrade" var="loginUserRole"/>
<sec:authentication property="principal.memberDTO.mEmail" var="loginUser"/>

	<!-- Page Heading -->
	<h1 class="h3 mb-4 text-gray-800">저널 작성</h1>

<form method="POST" action="/journal/register" enctype="multipart/form-data">

      <div class="form-group row">
        <label>내용</label>
        <textarea cols="5" class="form-control form-control-user" id="jContent" name="jContent"
                       placeholder="Content"></textarea>
      </div>
      <div class="form-group row">
        <label>작성자</label>
        <input type="text" class="form-control form-control-user" name="mEmail" value="${loginUser }" readonly>
      </div>
      <div class="form-group row">
      	<label>이미지 선택</label>
       	<input type="file" class="form-control form-control-user imageInput" name="image" >
      </div>
		<button class="btn btn-primary register">
			<span class="text">작성하기</span>
		</button>
		
	</form>
</div>
<!-- /.container-fluid -->
</sec:authorize>
</div>
<!-- End of Main Content -->

<script>

$(document).ready(function(){
	
	$(".register").on("click", function(){
		
		var content = $.trim($("#jContent").val());
		if(content == null || content == ""){
			alert("내용을 입력해주세요!");
			$("#jContent").focus();
			return false
		}
		
	});
	
	
	var imageInput = $(".imageInput");	
	
	var amount = 0;
	var fnoInselected="";
	var fnameInselected="";

	var amountDiv = $(".amountDiv");
	var regEx = new RegExp("\\.(bmp|gif|jpg|jpeg|png)$");
    var maxSize = 1024*1024*10;
    var appended = true;
    
    imageInput.change(function(e){

		
		var image = imageInput[0].files;
		console.log(image);
		var imageSize = image[0].size;
		var imageName = image[0].name;
		
		if(!(isSafeImage(imageSize, imageName))){
			appended = false;		
			}
		else{
			appended = true;			
			}	
			return appended;
		});

	function isSafeImage(imageSize, imageName){
        if(imageSize > maxSize){
            alert("10MB 이하의 이미지만 업로드 가능합니다.");
            return false;
        }
        if(!(regEx.test(imageName))){
            alert("이미지 파일만 업로드 가능합니다.");
            return false;
        }
        return true;
    };

});

</script>

<%@ include file="../include/footer.jsp"%>
