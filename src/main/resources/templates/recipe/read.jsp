<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!-- Begin Page Content -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css"> 
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<div class="container-fluid">

<style>
	.starBox {font-size:0; letter-spacing:-4px;}
	.starBox span {
	    font-size:22px;
	    letter-spacing:0;
	    display:inline-block;
	    margin-left:5px;
	    color:#FF46C5;
	    text-decoration:none;
	}
</style>
	<!-- Page Heading -->



	<div class="row">
		<div class="col-lg-12">
			<div class="card mb-4 py-3">
				<div class="card-body">
					<h1 class="h3 mb-4 text-gray-800">
						<c:out value="${dto.RTitle}"></c:out>
						
					</h1>

					<div class="form-group row">
						<p class="starBox"></p>
					</div>
					<sec:authorize access="isAuthenticated()">
						<div class="form-group row">
							<select class="form-select form-select-sm selectStarOption">
								<option value=5>5</option>
								<option value=4>4</option>
								<option value=3>3</option>
								<option value=2>2</option>
								<option value=1>1</option>
							</select>&nbsp;
							<button type="button"
								class="btn btn-primary btn-sm insertStarBtn">평가하기</button>
						</div>
					</sec:authorize>
					<div class="form-group row">
						<c:if test="${not empty dto.imageDTO && dto.imageDTO.IName!='' }">
							<a href="/image/show?imagePath=${dto.imageDTO.imagePath }"> <img
								src="/image/show?imagePath=${dto.imageDTO.thumbnailPath }">
								<p>크게보기</p>
							</a>
						</c:if>






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
													</select><br> <br> <b>날짜 입력 : </b> <input type="text"
														name="fmDate"
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





						<div class="col-xl-3 col-md-6 mb-4 totalKcalCard">
							<div class="card border-left-info shadow h-100 py-2">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">총 칼로리</h6>
								</div>
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">

											<div class="h2 mb-0 font-weight-bold text-gray-800 my-3"
												id="sumTotalKal"></div>
										</div>
									</div>
									<img src="/resources/imgs/recipe/recipe-kcal.svg"
										style='width: 80px; float: right; margin-right: 20px'>

								</div>
							</div>
						</div>
						
						
			<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-warning shadow h-100 py-2">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">영양소 정보</h6>
								</div>
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">

											<div class="h3 mb-0  text-gray-800 my-3"
												id="nutrientsSpec"></div>
										</div>
									</div>
									

								</div>
							</div>
						</div>




					</div>


					<!-- chart start -->
					<div class="row">
						<div class="col-xl-5 col-lg-5">
							<div class="card shadow mb-4 recipeSpecBox">
								<!-- Card Header-->
								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">레시피 영양소 정보</h6>

								</div>
								<!-- Card Body -->
								<div class="card-body">
									<div class="chart-area">
										<div class="chartjs-size-monitor">
											<div class="chartjs-size-monitor-expand">
												<div class=""></div>
											</div>
											<div class="chartjs-size-monitor-shrink">
												<div class=""></div>
											</div>
										</div>
										<canvas id="kaloriesSpecBar"
											style="display: block; height: 160px; width: 540px;"
											width="1080" height="320" class="chartjs-render-monitor">
										</canvas>
									</div>
								</div>
							</div>
						</div>



						<div class="col-xl-7 col-lg-7">
							<div class="card shadow mb-4 recipeSpecBox">
								<!-- Card Header-->
								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">레시피 영양소 비율</h6>

								</div>
								<!-- Card Body -->
								<div class="card-body">
									<div class="chart-area">
										<div class="chartjs-size-monitor">
											<div class="chartjs-size-monitor-expand">
												<div class=""></div>
											</div>
											<div class="chartjs-size-monitor-shrink">
												<div class=""></div>
											</div>
										</div>
										<canvas id="recipeSpecChart"
											style="display: block; height: 160px; width: 540px;"
											width="1080" height="320" class="chartjs-render-monitor">
										</canvas>
									</div>
								</div>
							</div>
						</div>
					</div>

	<!-- chart end -->
		
		<div class="form-group row">
						<b><label>조리법</label></b>
						<textarea style="height:200px;" class="form-control form-control-user" readonly>${dto.RContent}</textarea>
					</div>
					<div class="ingreBox">
						<ul>
							<c:if
								test="${not empty dto.ingredientList && dto.ingredientList.size() gt 0 }">

								<c:forEach var="ingredient" items="${dto.ingredientList}"
									varStatus="status">
								
									<li>
										<div class='card w-80'>
											<div class='card-body'>
											<a href='/food/FoodInfo?fNo=<c:out value="${ingredient.FNo}"/>'>
												<b class='card-title ingreName'>${ingredient.FName}</b>
												</a>
												<p class='card-text'>
													<span>양 (인분) : </span>${ingredient.riAmount}</p>
											</div>
										</div>
									</li>
								</c:forEach>

							</c:if>
						</ul>
					</div>

				</div>
			</div>
		</div>
	</div>




	<!-- 댓글 -->
	<div class="card mb-4 py-3">
		<div
			class="row height d-flex justify-content-center align-items-center">
			<div class="col-md-12">
				<div class="replycard ">


					<b class="mx-3">댓글</b>&nbsp;&nbsp;<img class="comment"
						src="/resources/imgs/comment.svg" width="30px">
					<%--  <input type="hidden" name="mEmail" value="${dto.MEmail }"/> --%>
					<input type="hidden" id="reRno" name="rNo" value="${dto.RNo }" />
					<sec:authorize access="isAuthenticated()">
						<div
							class="mt-3 d-flex flex-row align-items-center p-3 form-color">
							<textarea type="text" id="reContent" class="form-control"
								placeholder="Enter your comment..."></textarea>
							&nbsp;<input type="button" class="btn btn-primary replybtn"
								value="등록"></input>
						</div>

					</sec:authorize>
					<div class="mt-2" >

						<c:forEach var="reply" items="${dto.replyList}">
							<div class="d-flex flex-row p-3" >
								<div class="w-100 commentHome border-left-primary py-2 px-2" data-redate="${reply.reDate }" >
									<div class="d-flex justify-content-between align-items-center " >
										<div class="d-flex flex-row align-items-center">
											<b>${reply.MEmail}</b>
										</div>
										<small>${reply.reDate }</small>
									</div>
									<p data-comment-check="0">${reply.reContent}</p>
									<div class="input-group replyModify" data-reno="${reply.reNo }">
										<textarea rows="1" class="form-control">${reply.reContent}</textarea>
										<span><input type="button"
											class="btn btn-primary replyModifybtn" value="등록"></input></span>
									</div>


									<div>
										<div class="input-group commentTxt" data-reno="${reply.reNo}">
											<textarea rows="1" class="form-control"></textarea>
											&nbsp; <span><input type="button"
												class="btn btn-primary commentinsertbtn" value="등록"
												data-reno="${reply.reNo}"></input></span>
										</div>
										<div class="d-flex flex-row user-feed">
											<c:if test="${loginUser eq reply.MEmail}">
			                            		&nbsp;&nbsp;&nbsp;<span
													class="replymodify"><a class="replymodifybtn"
													data-commentcheck="0" data-reno="${reply.reNo }"><small>수정</small></a></span>
			                            		&nbsp;&nbsp;&nbsp;<span><a
													class="commentdel" data-commentcheck="0"
													data-reno="${reply.reNo }"><small>삭제</small></a></span>

											</c:if>
										</div>


									</div>
								</div>
							</div>
						</c:forEach>

					</div>

				</div>
			</div>
		</div>
		</div>
		<!-- 댓글 end -->

	


	<input type="hidden" class="form-control form-control-user" name="pageNum" value=${pageRequestDTO.pageNum }> 
	<input type="hidden" class="form-control form-control-user" name="keyword" value=${pageRequestDTO.keyword }> 
	<input type="hidden" class="form-control form-control-user" name="rNo" value="${dto.RNo}">

	<div class="form-group row">
		<input type="hidden" class="form-control form-control-user" value="${dto.MEmail}">
	</div>



	<a href="/recipe/list?pageNum=${pageRequestDTO.pageNum }&keyword=${pageRequestDTO.keyword}" class="btn btn-secondary">
       <span class="text">목록</span>
    </a>
  
    <c:if test="${loginUser eq dto.MEmail || loginUserRole eq 'ADMIN'}">
    <a href='/recipe/modify?rNo=${dto.RNo}&pageNum=${pageRequestDTO.pageNum }&keyword=${pageRequestDTO.keyword}' class="btn btn-warning">
        <span class="text">수정/삭제</span>
    </a>
    </c:if>
    
    
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

	var rNo = "${dto.RNo}";
	var commentList = "${reply.commentList}";
	var commentHome = $(".commentHome").data('redate');
	
	var starBox = $( ".starBox" );
	var msg = '${msg}';
	var ingreName = $(".ingreName");
	var ingreBox = $(".ingreBox");
	var insertStarBtn = $(".insertStarBtn");
	var selectStarOption = $(".selectStarOption");
	var insertFoodMyBtn =$(".insertFoodMyBtn");
	var mEmail = '${loginUser}';
	var recipeSpecList = [];
	var kaloriesSpecList = [];
	var ctx = document.getElementById("recipeSpecChart");
	var ctx2 = document.getElementById("kaloriesSpecBar");
	console.log("mEmail>>",mEmail);
	console.log("commentHome>>",commentHome);

	
	loadStar();
	loadSpec();


if(!commentHome){
		
		$(".commentHome").hide();
		} 

	
$(".replybtn").on("click", function(e) {
		
		
		
		//var mEmail = '${loginUser}'; //회원 아이디
		var reContent = $(this).closest(".replycard").find("#reContent").val(); //댓글 내용
		//var oriNo = $("#reJno").val();
		var oriNo = $(this).closest(".replycard").find("#reRno").val();
		var result= "";
		$.ajax({
			type : "POST",
			url : "/reply/replyinsert",
			data : {reContent : reContent,
					oriNo : oriNo,
					mEmail : mEmail,
					reDiv : "RCP"},
			dataType : "json",
			success :
				function(data){
				result= data;
				if(reContent=="" || reContent==null){
					alert("작성안됨");
				} else if(result==1){
					//alert("등록되었습니다");
					location.reload(); //새로고침
				}
				},
				error : function(){
					console.log("ajax 댓글 실패");
				}
		});
	});
	
	
	$(".commentinsertbtn").on("click", function(e) {
		
		//var mEmail = '${loginUser}';
		var oriNo = $(this).closest(".replycard").find("#reRno").val();
		var commentTxt = $(this).closest("div").find("textarea").val();
		var targetreNo = $(this).data('reno');
		var result= "";
		console.log(targetreNo);
		console.log(commentTxt);
		
		$.ajax({
			type : "POST",
			url : "/reply/commentinsert",
			data : {reContent : commentTxt,
					oriNo : oriNo,
					mEmail : mEmail,
					reDiv : "RCP",
					reGroup : targetreNo},
			dataType : "json",
			success :
				function(data){
				result= data;
				if(reContent=="" || reContent==null){
					alert("대댓글실패");
				} else if(result==1){
					alert("대댓글성공");
					location.reload();
				}
				},
				error : function(){
					console.log("ajax 대댓글 실패");
				}
		});
	});
	
	
	

$(".commentTxt").hide();
$(".replyModify").hide();
$(".commentModify").hide();

	
	$(".commentinsert").on("click", function(e) {
			
				$(this).parent().parent().parent().find(".commentTxt").toggle();
					
		});
	
	
	
	
	$(".commentdel").on("click", function(e) {
	
		var reNo = $(this).data('reno');
		var commentCheck = $(this).data('commentcheck');
		
		
		$.ajax({
			type : "POST",
			url : "/reply/replyDelete",
			data : {reNo : reNo,
					commentCheck : commentCheck},
			dataType : "json",
			success :
				function(data){
				var data = data;
				console.log(data);
				if(data >= 1){
					alert("삭제되었습니다.")

					
				}else{
					alert("본인이 작성한 댓글만 삭제 할 수 있습니다.")

				}
				location.reload();
				
			}
			
		});
		
		
	});
	
	$(".replymodifybtn").on("click", function(e){
		$(this).parent().parent().parent().parent().find(".replyModify").toggle();
	});
	
	$(".commentmodify").on("click", function(e){
		$(this).parent().parent().find(".commentModify").toggle();
	});

	
	
	$(".replyModifybtn").on("click", function(e) {
		
		var reNo = $(this).parent().parent().data('reno');
		var reContent = $(this).closest(".commentHome").find("textarea").val();
		
		//console.log(reNo);
		//console.log(reContent);
		
		
		$.ajax({
			type : "POST",
			url : "/reply/replyModify",
			data : {reContent : reContent,
					reNo : reNo},
			dataType : "json",
			async:false
		});
			
		location.reload();
		
	});
	
	
	$(".commentModifybtn").on("click", function(e) {
			
			var reNo = $(this).parent().parent().data('reno');
			var reContent = $(this).parent().parent().find("textarea").val();
			
			console.log(reNo);
			console.log(reContent);
			
			
			$.ajax({
				type : "POST",
				url : "/reply/replyModify",
				data : {reContent : reContent,
						reNo : reNo},
				dataType : "json",
				async:false
			});
				
			location.reload();
			
		});









	
	
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
	
			//이거 살릴까요 말까요? 선택 안하면 자동으로 오늘날짜라서 에러는 없긴 함...
			if(!fmDate){
				alert("날짜를 선택해 주십시오..");
				return;
				}
			
			var foodMyDTO = {
				"mEmail" : mEmail,
				"rNo" : rNo,
				"fmAmount" : fmAmount,
				"fmDate" : fmDate
					}

			console.log("foodMyDTO>>", foodMyDTO);
		$.ajax({
				 url:"/recipe/registerFoodMy",
		            method:"POST",
		            data:JSON.stringify(foodMyDTO),
		            contentType:"application/json; charset=utf-8",
		            success:function(result){
			            console.log(result);
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

	function loadSpec(){

		$.ajax({
			 url:"/recipe/spec/"+rNo,
	           method:"GET",
	           dataType:"json",
	           success:function(result){
		            console.log(result);
					console.log(result.sumCarbo);
					console.log(result.sumKcal);

					
					if(result.sumCarbo+ result.sumProtein+ result.sumFat==0){
						$(".recipeSpecBox").remove();
						var sstr = "";
						sstr+= "<div><h2>"+result.sumKcal+" kcal</h2></div>";
						$("#sumTotalKal").append(sstr);

						var ssstr="";
						ssstr+= "<div class='my-3'>탄수화물 : "+result.sumCarbo+" g</div>";
						ssstr+= "<div class='my-3'>단백질 : "+result.sumProtein+" g</div>";
						ssstr+= "<div class='my-3'>지방 : "+result.sumFat+" g</div>";
						$("#nutrientsSpec").append(ssstr);

						
						 return; }
					else{
						
						kaloriesSpecList.push(/* result.sumKcal, */result.sumCarbo,result.sumProtein,result.sumFat );

						var sstr = "";
						sstr+= "<b>"+result.sumKcal+" kcal</b>";
						$("#sumTotalKal").append(sstr);
						
						var ssstr="";
						ssstr+= "<div class='my-3'>탄수화물 : "+result.sumCarbo+" g</div>";
						ssstr+= "<div class='my-3'>단백질 : "+result.sumProtein+" g</div>";
						ssstr+= "<div class='my-3'>지방 : "+result.sumFat+" g</div>";
						$("#nutrientsSpec").append(ssstr);

						
						var sums = result.sumCarbo+ result.sumProtein+ result.sumFat ;
						var sumCarbo = Math.round((result.sumCarbo/sums)*100);
						var sumProtein = Math.round((result.sumProtein/sums)*100);
						var sumFat = Math.round((result.sumFat/sums)*100);
						
						recipeSpecList.push(sumCarbo, sumProtein, sumFat);
						console.log("recipeSpecList>> ", recipeSpecList);


						var myChart = new Chart(ctx, {
							  type: 'doughnut',
							  data: {
							    labels: ['탄수화물 % ', '단백질 % ', '지방 %'],
							    datasets: [{
							      label: '# nutrients + %',
							      data: recipeSpecList,
							      backgroundColor: [
							        'rgba(255, 99, 132, 0.5)',					      				        
							        'rgba(75, 192, 192, 0.2)',
							        'rgba(255, 206, 86, 0.2)'
							      ],
							      borderColor: [
							        'rgba(255,99,132,1)',					       
							        'rgba(75, 192, 192, 1)',
							        'rgba(255, 206, 86, 1)'
							      ],
							      borderWidth: 3
							    }]
							  },
							  options : {
								  responsive: true,
									maintainAspectRatio : false, // default value. false일 경우 포함된 div의 크기에 맞춰서 그려짐.
									scales : {
										yAxes : [ {
											ticks : {
												beginAtZero : true
											}
										} ]
									},
							    plugins: {
							        datalabels: {
							          color: 'grey',
							          anchor: 'center',
							          borderWidth: 2,
							          align: 'end',
							          offset: 10,
							          borderColor: '#fff',
							          borderRadius: 25,
							          backgroundColor: (context) => {
							            return context.dataset.backgroundColor;
							          },
							          labels: {
							            title: {
							              font: {
							                weight: 'bold'
								            					              
							              }
							            },
							            value: {
							              color: 'green'
							            }
							          }
							        }
							      }//plugins end
								
								}//options end
							});//nutrientDoughutgraph end

							var myChart2 = new Chart(ctx2, {
						    type: 'bar',
						    data: {
						        labels: ['탄수화물', '단백질', '지방'],
						        datasets: [{
						            label: '# g',
						            data: kaloriesSpecList,
						            borderColor: "rgba(130, 24, 32, 1)",
						            backgroundColor: "rgba(125, 231, 213, 0.5)",
						            fill: false,
						        }]
						    },
						    options: {
						        responsive: true,
						        maintainAspectRatio : false,
						        
						        tooltips: {
						            mode: 'index',
						            intersect: false,
						        },
						        hover: {
						            mode: 'nearest',
						            intersect: true
						        },
						        scales: {
						            xAxes: [{
						                display: true,
						                scaleLabel: {
						                    display: true
						                    
						                },
						            }],
						            yAxes: [{
						                display: true,
						                ticks: {
						                    autoSkip: false,
						                },
						                scaleLabel: {
						                    display: true
						                   
						                }
						            }]
						        },plugins: {
							        datalabels: {
								          color: 'grey',
								          anchor: 'center',
								          borderWidth: 2,
								          align: 'end',
								          offset: 10,
								          borderColor: '#fff',
								          borderRadius: 25,
								          backgroundColor: (context) => {
								            return context.dataset.backgroundColor;
								          },
								          labels: {
								            title: {
								              font: {
								                weight: 'bold'
									            					              
								              }
								            },
								            value: {
								              color: 'green'
								            }
								          }
								        }
								      }//plugins end
						    }
						});


		
						}

					
		            },
		        error: function(xhr,status,errorThrown){
			        console.log("xhr >>",xhr);			
			        }
			});

		
		};
	
	
	insertStarBtn.click(function(e){
		var starPoint = selectStarOption.val();

		console.log("rNo>>",rNo);
		console.log("starPoint>>" , starPoint);
	var recipeGradeDTO = {
		"rNo" : rNo,
		"mEmail" : mEmail,
		"rgGrade" : starPoint
		} 
		console.log(recipeGradeDTO);
		$.ajax({
			 url:"/recipe/grade",
	            method:"POST",
	            data:JSON.stringify(recipeGradeDTO),
	            contentType:"application/json; charset=utf-8",
	            success:function(result){
		            console.log(result);
		            loadStar();
		            },
		        error: function(xhr,status,errorThrown){
			        console.log("xhr >>",xhr);			
			        }
			});
		});
	function loadStar(){
		starBox.empty();
		
		$.getJSON("/recipe/grade/"+rNo, function(result){
			var avg = result;
			var star = Math.round(result);

			for(var i=1; i<=star ; i++){
				starBox.append("<span>★</span>");
				}
			for(var i=1 ; i<=5-star; i++){
				starBox.append("<span>☆</span>");
				}			
			starBox.append("<span>("+ result +")</span>");
			});
		}


	
	console.log("msg>>",msg);
	console.log("ingreName>>",ingreName);
	if (!(msg===''||history.state)){
		var modal= $(".modal");
		console.log(modal);	
		modal.modal();
	}


	if(ingreName.text()==''|| ingreName.text()==null){
		console.log("$(this).closest('li')>>",$(this).closest('li'));
		ingreName.closest('li').remove();
		}
});
	
</script>
<%@ include file="../include/footer.jsp"%>
