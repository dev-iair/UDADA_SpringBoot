<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-4 text-gray-800">레시피 수정하기</h1>
	
	<form method="POST" action="/recipe/modify" enctype="multipart/form-data">
	<input type="hidden" class="form-control form-control-user" name="pageNum" id="pageNum" value=${pageRequestDTO.pageNum }>
	<input type="hidden" class="form-control form-control-user" name="keyword" id="keyword" value=${pageRequestDTO.keyword }>
	<input type="hidden" class="form-control form-control-user" name="rNo" value="${dto.RNo}">
	<div class="form-group row">
      <c:if test="${not empty dto.imageDTO && dto.imageDTO.IName!='' }">
	     <a href="/image/show?imagePath=${dto.imageDTO.imagePath }">      	
			<img src="/image/show?imagePath=${dto.imageDTO.thumbnailPath }">
			<p>크게보기</p>
		 </a>
	  </c:if>	  
	</div>
	  
      <div class="form-group row">
        <label>요리의 이름</label>
        <input type="text" class="form-control form-control-user" name="rTitle" value="${dto.RTitle}" >
      </div>
      <div class="form-group row">
        <label>조리법</label>
        <textarea style="height:200px;" class="form-control form-control-user"  name="rContent">${dto.RContent}</textarea>
      </div>
      <div class="form-group row">
        <label>작성자</label>
        <input type="text" class="form-control form-control-user"  name="mEmail" value="${dto.MEmail}" readonly>
      </div>
      <div class="form-group row">
        <button class="btn btn-secondary addIngreBtn"><span class="text">재료 추가하기</span></button>
      </div>  
	<div class="ingreBox">
		<ul>
			<c:if test="${not empty dto.ingredientList && dto.ingredientList.size() gt 0}">
				<c:forEach var="ingredient" items="${dto.ingredientList}">
					<li data-fno='${ingredient.FNo }' data-amount='${ingredient.riAmount}'>
						<div class='card w-80'>
							<div class='card-body'>
								<b class='card-title ingreName'>${ingredient.FName}</b>
								<p class='card-text'>
									<span>양 (인분) : </span>${ingredient.riAmount}</p>
									<button type='button' class='btn btn-danger btn-sm cancelIngre' >&times;</button>
							</div>
						</div>
					</li>
				</c:forEach>

			</c:if>
		</ul>
	</div>
	<br>
	  <div class="form-group row">
        <label>새로운 이미지</label>
        <input type="file" class="form-control form-control-user imageInput" name="image" >
      </div>
       <div class="form-group row">
         <label>원본이미지</label>
         <c:if test="${not empty dto.imageDTO && dto.imageDTO.IName!='' }">
         <input type="text" class="form-control form-control-user"  name="imageDTO.iName" value="${dto.imageDTO.IName}" readonly>
         <input type="hidden" class="form-control form-control-user" name="imageDTO.iUuid" value=${dto.imageDTO.IUuid }>
         <input type="hidden" class="form-control form-control-user" name="imageDTO.oriNo" value=${dto.imageDTO.oriNo }>
         <input type="hidden" class="form-control form-control-user" name="imageDTO.iDir"  value=${dto.imageDTO.IDir }>
         <input type="hidden" class="form-control form-control-user" name="imageDTO.iDiv"  value=${dto.imageDTO.IDiv }>
         </c:if>
        </div>

      	 
		      <a class="btn btn-secondary listBtn">
		            <span class="text">목록</span>
		       </a>
		       
		<sec:authorize access="isAuthenticated()">
 		<sec:authentication property="principal.memberDTO.mGrade" var="loginUserRole"/> 
		<sec:authentication property="principal.memberDTO.mEmail" var="loginUser" />
		
			<c:if test="${loginUser eq dto.MEmail || loginUserRole eq 'ADMIN'}">
				<a class="btn btn-warning modBtn"> <span class="text">수정</span>
				</a>
				<a class="btn btn-danger removeBtn"> <span class="text">삭제</span>
				</a>
			</c:if>
		</sec:authorize>
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
              			<input class="form-control amountInput" type="text" value=1.0 placeholder="Add Amount...">
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
	var form = $("form");
	var modal = $("#addIngreModal");
	var searchBtn = $(".searchBtn");
	var amountBtn = $(".amountBtn");
	var amountDiv = $(".amountDiv");
	var searchInput = $(".searchInput");
	var amountInput = $(".amountInput");	
	var ingreBox = $(".ingreBox");	
	
	var cloneModal = modal.clone();
	var str2="";	
	var amount = 0;
	var fnoInselected="";
	var fnameInselected="";

	var ingreName = $(".ingreName");

	if(ingreName.text()==''|| ingreName.text()==null){
		console.log("$(this).closest('li')>>",$(this).closest('li'));
		ingreName.closest('li').remove();
		}
	
	$(".modBtn").on("click",function(e){
		e.preventDefault();
		var str="";
		 $(".ingreBox li").each(function (i , obj){
			 var target =$(obj);
			console.log(target);
			console.log(target.data('fno'));
			str +="<input type='hidden' type='text' name='ingredientList["+ i +"].fNo' value='"+ target.data('fno') +"'>"
			str +="<input type='hidden' type='text' name='ingredientList["+ i +"].riAmount' value='"+ target.data('amount') +"'>"

			 });
		 form.append(str);
		 form.submit();
		 
		});
	
	$(".listBtn").on("click",function(e){
		e.preventDefault();
		console.log($(this));
		var pageNum = $("#pageNum").clone();
		var keyword = $("#keyword").clone();
		console.log("pageNum>>",pageNum);
		console.log("keyword>>",keyword);
		
		form.empty();
		form.append(pageNum);
		form.append(keyword);
		form.attr("method","GET");

		form.attr("action","/recipe/list");
		console.log(form);
		form.submit();
		});
	
	$(".removeBtn").on("click",function(e){
		e.preventDefault();
	if(confirm("삭제하시겠습니까? ")){
		form.attr("action","/recipe/remove");
		console.log(form);
		form.submit();
		}
		});
	
	amountBtn.click(function(e){		
		e.preventDefault();
		amount = amountInput.val();			
		console.log("amount>>" ,amount);
	 	str2 = "<li data-amount='"+ amount +"' data-fno='"+ fnoInselected +"'><div class='card w-80'>"
			+ "<div class='card-body'><b class='card-title'>" + fnameInselected + "</b>"
	    	+ "<p class='card-text' >selected amount : "+amount +" </p>"
	    	+ "<button type='button' class='btn btn-danger btn-sm cancelIngre' >&times;</button>"
	  		+ "</div></div></li>" 

		ingreBox.append(str2);
		modal.modal('hide');
	
		});
	
	 ingreBox.on("click",".cancelIngre", function(e){
			console.log($(this));
			$(this).closest('li').remove();

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
		var str = "";
			$.getJSON("/searchForIngredient?keyword="+keyword, function(array){
					
				searchBtn.hide();				
				
					$.each(array, function(idx,obj){
					//console.log(obj);
					str+="<li data-fno='"+ obj.fno +"' data-fname='" + obj.fname+ "'>"
					  + "<div class='card w-80'><div class='card-body'><b class='card-title'>"+obj.fname+"</b>"
					  +  "<p class='card-text'><span>carbo : "+ obj.fcarbo +"</span>&nbsp;"
					  + "<span>protein : "+ obj.fprotein +"</span>&nbsp;"
				      + "<span>fat : "+ obj.ffat +"</span>&nbsp;"
				      +   "<span>kcal : "+ obj.fkcal +"</span></p>"
					  + "<button type='button' class='btn btn-success btn-sm addBtn'>재료 추가하기</button>"
					  + "</div></div></li><br>"
					
					});
			
					$(".searchResult ul").append(str);
					
			}); 
			
		});
});
	
</script>
<%@ include file="../include/footer.jsp"%>
