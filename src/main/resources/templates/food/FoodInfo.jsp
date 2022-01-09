<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- Begin Page Content -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css"> 
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

<style type="text/css">
	li {list-style: none; float: left; padding: 6px;}
</style>

<div class="container-fluid">

    <div class="h3 mb-4 text-gray-800">
		<h1 class="h3 mb-0 text-gray-800"><c:out value="${dto.FName}"></c:out></h1>
	</div>
		
    <div class="row">
        	 
        
		<div class="col-xl-3 col-md-6 mb-4">
		
			<div class="card border-left-primary shadow h-100 py-2">
			
				<div class="card-body">
				
					<div class="row no-gutters align-items-center">
					
						<div class="col mr-2">
						
							<div class="text-xs" font-weight-bold text-primary text-uppercase mb-1"> 식품 칼로리 </div>
							<div class="h5 mb-0 font-weight-bold text-gray-800"><c:out value="${dto.FKcal}"/>kcal</div>
						
						</div>
					
					</div>
				
				</div>
			
			</div>
		
		</div>
		
		<div class="col-xl-3 col-md-6 mb-4">
		
			<div class="card border-left-success shadow h-100 py-2">
		
				<div class="card-body">
				
					<div class="row no-gutters align-items-center">
					
						<div class="col mr-2">
						
							<div class="text-xs" font-weight-bold text-primary text-uppercase mb-1"> 식품 탄수화물 </div>
							<div class="h5 mb-0 font-weight-bold text-gray-800"><c:out value="${dto.FCarbo}"/>g</div>
						
						</div>
					
					</div>
				
				</div>
			
			</div>
		
		</div>
		
		<div class="col-xl-3 col-md-6 mb-4">
		
			<div class="card border-left-success shadow h-100 py-2">
		
				<div class="card-body">
				
					<div class="row no-gutters align-items-center">
					
						<div class="col mr-2">
						
							<div class="text-xs" font-weight-bold text-primary text-uppercase mb-1"> 식품 단백질 </div>
							<div class="h5 mb-0 font-weight-bold text-gray-800"><c:out value="${dto.FProtein}"/>g</div>
						
						</div>
					
					</div>
				
				</div>
			
			</div>	
		
		</div>
		
		<div class="col-xl-3 col-md-6 mb-4">
		
			<div class="card border-left-success shadow h-100 py-2">
		
			<div class="card-body">
			
				<div class="row no-gutters align-items-center">
				
					<div class="col mr-2">
					
						<div class="text-xs" font-weight-bold text-primary text-uppercase mb-1"> 식품 지방 </div>
						<div class="h5 mb-0 font-weight-bold text-gray-800"><c:out value="${dto.FFat}"/>g</div>
					
					</div>
				
				</div>
			
			</div>
		
		</div>	
		
		</div>
		
		<sec:authorize access="isAuthenticated()">
							<!-- Insert to MyFood Card -->
							<div class="col-xl-4 col-md-4 mb-4">
								<div class="card border-left-primary shadow h-100 py-2">
									<div class="card-header py-3">
										<h6 class="m-0 font-weight-bold text-primary">마이 푸드 다이어리에
											추가하기</h6>
									</div>
									<div class="card-body">
										<div class="row no-gutters align-items-center">
											<div class="col mr-2">

												<div class="form-group my-2">
													<b>양 입력 : </b> <select class="form-select fmAmountOption">
														<option value=1>1 인분</option>
														<option value=2>2 인분</option>
														<option value=3>3 인분</option>
													</select><br>
													<br> <b>날짜 입력 : </b> <input type="text" name="fmDate"
														class="form-control form-control-user daySelector"
														required>

													<button type="button"
														class="btn btn-primary insertFoodMyBtn my-3 float-right">추가</button>
												</div>
												<div class="goToFoodMyBox"></div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- Insert to MyFood Card End-->
						</sec:authorize>	
            
    </div>

</div>

<script type="text/javascript">

$(document).ready(function(){
	
	var fNo = "${dto.FNo}";
	var insertFoodMyBtn =$(".insertFoodMyBtn");
	var mEmail = '${loginUser}';
	console.log("fNo>>", fNo);
	
	$(".daySelector").flatpickr(
			{
				   dateFormat: "Y-m-d",
				   maxDate:new Date()
			}
		);
	
	insertFoodMyBtn.on("click", function(e){
		e.preventDefault();
		console.log($(this));
		var fmAmount = $(".fmAmountOption").val();	
		var fmDate = $(".daySelector").val();
		console.log("fmDate>>", fmDate);
		console.log(typeof fmDate);
		var foodMyDTO = {
			"mEmail" : mEmail,
			"fNo" : fNo,
			"fmAmount" : fmAmount,
			"fmDate" : fmDate
				}
		
		console.log("foodMyDTO>>", foodMyDTO);
		$.ajax({
			 url:"/food/registerFoodMy",
	            method:"POST",
	            data:JSON.stringify(foodMyDTO),
	            contentType:"application/json; charset=utf-8",
	            success:function(result){
		            
		            $(".goToFoodMyBox").empty();
		            alert("마이 푸드에 저장되었습니다.");
		            var str = "";
		            str += "<a href='/member/foodMy?day="+ fmDate +"'>마이 푸드로 이동하기</a>";
		            $(".goToFoodMyBox").append(str);
		            },
		        error: function(xhr,status,errorThrown){
			        console.log("xhr >>",xhr);			
			        }
			}); 
		
	});
	
})

</script>
        
<%@ include file="../include/footer.jsp"%>