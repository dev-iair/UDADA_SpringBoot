<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-4 text-gray-800">새 레시피 등록하기</h1>

<form method="POST" action="/recipe/register" enctype="multipart/form-data">
      <div class="form-group row">
        <label>요리의 이름</label>
        <input type="text" class="form-control form-control-user required" name="rTitle" id="rTitle">
      </div>
      <div class="form-group row">
        <label>조리법</label>
        <textarea style="height:200px;" class="form-control form-control-user required" name="rContent" id="rContent"></textarea>
      </div>
      <div class="form-group row">
        <button class="btn btn-secondary addIngreBtn"><span class="text">재료 추가하기</span></button>
      </div>
      <div class="ingreBox"></div>
      <br>
      <div class="form-group row">
        <label>대표 이미지</label>
        <input type="file" class="form-control form-control-user imageInput" name="image" >
      </div>
      <div class="form-group row">
        <label>작성자</label>
        <input type="text" class="form-control form-control-user" name="mEmail" 
        	value='<sec:authentication property="principal.memberDTO.mEmail" />' readonly>
      </div>
		<button class="btn btn-primary registerBtn">
			<span class="text">등록하기</span>
		</button>
	</form>
	

</div>
<!-- /.container-fluid -->
</div>

<!-- End of Main Content -->
<div class="modal" tabindex="-1" role="dialog" id="addIngreModal">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">재료 추가하기</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">                 
                    <div class="form-group">
              			<input class="form-control searchInput" type="text" placeholder="추가할 재료 이름을 검색해 주십시오...">
           			 </div>
           			<div class="form-group amountDiv">
           			<b>양 (인분) 입력:</b>
              			<input class="form-control amountInput" type="text" value=1.0 placeholder="양을 입력해 주십시오...">
           			 </div>
           			 <div class="searchResult">
           			 	<ul></ul>
           			 </div>
					</div>
                    <div class="modal-footer">
                    	<button type="button" class="btn btn-success searchBtn">SEARCH</button>
                     	<button type="button" class="btn btn-success amountBtn">재료 추가하기</button>         
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
<script>

$(document).ready(function(){
	var modal = $("#addIngreModal");
	var searchBtn = $(".searchBtn");
	var amountBtn = $(".amountBtn");
	var amountDiv = $(".amountDiv");
	var searchInput = $(".searchInput");
	var amountInput = $(".amountInput");
	var imageInput = $(".imageInput");	
	var ingreBox = $(".ingreBox");	
	
	var cloneModal = modal.clone();
	var str2="";	
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

	
	$(".registerBtn").click(function(e){
		e.preventDefault();
		console.log(this);


		if(!($("#rTitle").val())){

			alert("레시피의 이름을 입력해 주십시오");
			return;
			}
		if(!($("#rContent").val())){

			alert("조리법을 입력해 주십시오");
			return;
			}
		
		if(appended){

			var str="";
			 $(".ingreBox li").each(function (i , obj){
				 var target =$(obj);
				console.log(target);
				console.log(target.data('fno'));
				str +="<input type='hidden' type='text' name='ingredientList["+ i +"].fNo' value='"+ target.data('fno') +"'>"
				str +="<input type='hidden' type='text' name='ingredientList["+ i +"].riAmount' value='"+ target.data('amount') +"'>"

				 });
			 $("form").append(str);
			 
			}
			
		$("form").submit();
	});
	
	$(".searchResult ul").on("click","button",function(e){

		var selected = $(this).closest("li").clone();
		$(".searchResult ul").empty();
		$(".searchResult ul").html(selected);
		console.log("selected>>>",selected);
		$(".addBtn").hide();
		amountDiv.show();
		amountBtn.show();
		fnoInselected = selected.data('fno');
		fnameInselected = selected.data('fname');

	});	


	amountBtn.click(function(e){		
			e.preventDefault();
			amount = amountInput.val();			
			console.log("amount>>" ,amount);
		 	str2 = "<li data-amount='"+ amount +"' data-fno='"+ fnoInselected +"'><div class='card w-80'>"
				+ "<div class='card-body'><b class='card-title'>" + fnameInselected + "</b>"
		    	+ "<p class='card-text' >양 (인분) : "+amount +" </p>"
		    	+ "<button type='button' class='btn btn-danger btn-sm cancelIngre' >&times;</button>"
		  		+ "</div></div></li>" 
 
			ingreBox.append(str2);
			modal.modal('hide');
		
			});

	
   ingreBox.on("click",".cancelIngre", function(e){
		console.log($(this));
		$(this).closest('li').remove();

		}); 
	
	$(".addIngreBtn").on("click", function(e){
		e.preventDefault();
		searchInput.val('');
		amountInput.val(1.0);
		$(".searchResult ul").empty();
		searchBtn.show();
		modal.find(".amountBtn").hide();
		modal.find(".amountDiv").hide();
		modal.modal();

			
		});

	searchBtn.click(function(e){
		e.preventDefault();			
		var keyword = searchInput.val();
		
			$.getJSON("/searchForIngredient?keyword="+keyword, function(array){
				var str = "";
				searchBtn.hide();				
				console.log("searchForIngredient result >>",array);
				if(array.length==0){
					str += "<p>검색 결과가 없습니다. </p>"
					}
				else{

					$.each(array, function(idx,obj){
						//console.log(obj);
						str+="<li data-fno='"+ obj.fno +"' data-fname='" + obj.fname+ "'>"
						  + "<div class='card w-80'><div class='card-body'><b class='card-title'>"+obj.fname+"</b>"
						  +  "<p class='card-text'><span>탄수화물 : "+ obj.fcarbo +"</span>&nbsp;"
						  + "<span>단백질 : "+ obj.fprotein +"</span>&nbsp;"
					      + "<span>지방 : "+ obj.ffat +"</span>&nbsp;"
					      +   "<span>칼로리 : "+ obj.fkcal +"</span></p>"
						  + "<button type='button' class='btn btn-success btn-sm addBtn'>재료 추가하기</button>"
						  + "</div></div></li><br>"
						
						});
					}
				
			
					$(".searchResult ul").append(str);
					
			}); 
			
		});
});
	

</script>
<%@ include file="../include/footer.jsp"%>
