<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<div class="row">
	<div class="col-xl-3 col-md-6 mb-4">
		<div class="card border-left-primary shadow h-100 py-2">
			<div class="card-body">
				<div class="row no-gutters align-items-center">
					<div class="col mr-2">
						<div
							class="text-xs font-weight-bold text-primary text-uppercase mb-1">
							날짜</div>
						<div class="h5 mb-0 font-weight-bold text-gray-800">${map.day }</div>
					</div>
					<div class="col-auto">
						<i class="fas fa-calendar fa-2x text-gray-300"></i>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-xl-3 col-md-6 mb-4">
		<div class="card border-left-info shadow h-100 py-2">
			<div class="card-body">
				<div class="row no-gutters align-items-center">
					<div class="col mr-2">
						<div
							class="text-xs font-weight-bold text-info text-uppercase mb-1">
							총 섭취 칼로리</div>
						<div class="h5 mb-0 font-weight-bold text-gray-800">
								<c:if test="${empty map.dayTotalDTO.dayTotalKcal}">
									<span>0 </span>
								</c:if>
								<span>${map.dayTotalDTO.dayTotalKcal} Kcal</span>
							</div>
					</div>
					<div class="col-auto">
						<i class="fas fa-apple-alt fa-2x text-gray-300"></i>
					</div>
				</div>
			</div>
		</div>
	</div>
		<div class="col-xl-3 col-md-6 mb-4">
		<div class="card border-left-warning shadow h-100 py-2">
			<div class="card-body">
				<div class="row no-gutters align-items-center">
					<div class="col mr-2">
						<div
							class="text-xs font-weight-bold text-warning text-uppercase mb-1">
							권장 칼로리</div>
						<div class="h5 mb-0 font-weight-bold text-gray-800">

							<span>	${map.recommendDTO.recommendKcal} Kcal</span>
							</div>
					</div>
					<div class="col-auto">
						<i class="fas fa-check-square fa-2x text-gray-300"></i>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">마이 푸드 다이어리</h6>
		</div>
		<div class="card-body">
			<table class="table table-bordered table-hover" width="100%"
				cellspacing="0">
				<thead>
					<tr>
						<th scope="col">푸드 이름</th>
						<th scope="col">양 (인분)</th>
						<th scope="col">칼로리</th>
						<th scope="col">탄수화물</th>
						<th scope="col">단백질</th>
						<th scope="col">지방</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach var="dto" items="${list}">

						<tr>
							<th scope="row"><c:choose>
									<c:when test="${not empty dto.RTitle}">
										<a
										href='/recipe/read?rNo=<c:out value="${dto.RNo}"/>'>
										<c:out value="${dto.RTitle}" />
										</a>
									</c:when>
									<c:otherwise>
									<a
										href='/food/FoodInfo?fNo=<c:out value="${dto.FNo}"/>'>
										<c:out value="${dto.FName}" />
										</a>
									</c:otherwise>
								</c:choose></th>
							<td><select class="form-select fmAmountModify"
								data-fmNo="${dto.fmNo }">
									<option value=1 ${dto.fmAmount eq 1? "selected":"" }>1
										인분</option>
									<option value=2 ${dto.fmAmount eq 2? "selected":"" }>2
										인분</option>
									<option value=3 ${dto.fmAmount eq 3? "selected":"" }>3
										인분</option>
							</select> &nbsp;
								<button type="button"
									class="btn btn-outline-danger btn-sm removeFmBtn"
									data-fmNo="${dto.fmNo }">&times;</button></td>
							<td><c:choose>
									<c:when test="${not empty dto.RTitle}">
										<c:out value="${dto.rsKcal}" />
									</c:when>
									<c:otherwise>
										<c:out value="${dto.fsKcal}" />
									</c:otherwise>
								</c:choose></td>
							<td><c:choose>
									<c:when test="${not empty dto.RTitle}">
										<c:out value="${dto.rsCarbo}" />
									</c:when>
									<c:otherwise>
										<c:out value="${dto.fsCarbo}" />
									</c:otherwise>
								</c:choose></td>
							<td><c:choose>
									<c:when test="${not empty dto.RTitle}">
										<c:out value="${dto.rsProtein}" />
									</c:when>
									<c:otherwise>
										<c:out value="${dto.fsProtein}" />
									</c:otherwise>
								</c:choose></td>
							<td><c:choose>
									<c:when test="${not empty dto.RTitle}">
										<c:out value="${dto.rsFat}" />
									</c:when>
									<c:otherwise>
										<c:out value="${dto.fsFat}" />
									</c:otherwise>
								</c:choose></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

		</div>

	</div>
	
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">당신을 위한 메시지</h6>
		</div>
		<div class="card-body">
			<div>
				<span>${map.recommendDTO.message}</span>
				<img src="/resources/imgs/foodMy/${map.recommendDTO.img}" style='width:100px;float:right'>
				
				<div style='margin-top:10px'>
				<a href="/recipe/list" class="btn btn-primary"> 
						<span class="text">레시피 탐색하기</span>
				</a>
				<a href="/food/list" class="btn btn-primary my-2"> 
						<span class="text">푸드 탐색하기</span>
				</a>
				</div>
			</div>
		</div>
	</div>
	
	<div class="row">
  <!-- Area Chart -->
		<div class="col-xl-8 col-lg-7">
			<div class="card shadow mb-4">
				<!-- Card Header-->
				<div
					class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h6 class="m-0 font-weight-bold text-primary">영양소 섭취 정보</h6>

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
						<canvas id="nutrientChart"
							style="display: block; height: 160px; width: 540px;" width="1080"
							height="320" class="chartjs-render-monitor">
						</canvas>
					</div>
				</div>
			</div>
		</div>
		
		
		<div class="col-xl-4 col-lg-5">
			<div class="card shadow mb-4">
				<!-- Card Header-->
				<div
					class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h6 class="m-0 font-weight-bold text-primary">칼로리 정보</h6>

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
						<canvas id="CaloriesGraph"
							style="display: block; height: 160px; width: 540px;" width="1080"
							height="320" class="chartjs-render-monitor">
						</canvas>
					</div>
				</div>
			</div>
		</div>




	</div>
	
	<!-- /.container-fluid -->
</div>
<!-- End of Main Content -->
<script>
	$(document).ready(function() {

		var fmAmountModify = $(".fmAmountModify");
		var removeFmBtn = $(".removeFmBtn");
		var dayTotalKcal = '${map.dayTotalDTO.dayTotalKcal}';
		var dayTotalCarbo = '${map.dayTotalDTO.dayTotalCarbo}';
		var dayTotalProtein = '${map.dayTotalDTO.dayTotalProtein}';
		var dayTotalFat = '${map.dayTotalDTO.dayTotalFat}';
		var recommendKcal = '${map.recommendDTO.recommendKcal}';		
		var ctx2 = document.getElementById("nutrientChart");
		var ctx = document.getElementById("CaloriesGraph");
		
		var nutrientList = [];
		var totalN = Number(dayTotalCarbo) + Number(dayTotalProtein) + Number(dayTotalFat);
	
		dayTotalCarbo = Math.round((dayTotalCarbo/totalN)*100) ;
		dayTotalProtein = Math.round((dayTotalProtein/totalN)*100) ;
		dayTotalFat = Math.round((dayTotalFat/totalN)*100) ;
		nutrientList.push(dayTotalCarbo , dayTotalProtein , dayTotalFat);
		
		console.log("recommendKcal>>", recommendKcal);
		console.log("dayTotalKcal>>", dayTotalKcal);

		makeNutrientChart();

		removeFmBtn.on("click", function() {
			var target = $(this);
			var fmNo = target.data('fmno');
			console.log(fmNo);

			$.ajax({
				url : "/removeFoodMy",
				method : "POST",
				data : JSON.stringify({
					"fmNo" : fmNo
				}),
				contentType : "application/json; charset=utf-8",
				success : function(result) {
					console.log(result);
					reload();
				},
				error : function(xhr, status, errorThrown) {
					console.log("xhr >>", xhr);
				}
			});
		});

		fmAmountModify.on("change", function(e) {

			var target = $(this);
			var fmNo = target.data('fmno');
			var fmAmount = target.val();

			var foodMyDTO = {
				"fmNo" : fmNo,
				"fmAmount" : fmAmount
			}
			$.ajax({
				url : "/modifyFoodMy",
				method : "POST",
				data : JSON.stringify(foodMyDTO),
				contentType : "application/json; charset=utf-8",
				success : function(result) {
					console.log(result);
					reload();
				},
				error : function(xhr, status, errorThrown) {
					console.log("xhr >>", xhr);
				}
			});

		});

		function reload() {
			setTimeout("location.reload()", 50);
		}

	function makeNutrientChart(){
		var myChart2 = new Chart(ctx2, {
		  type: 'doughnut',
		  data: {
		    labels: ['탄수화물 % ', '단백질 % ', '지방 %'],
		    datasets: [{
		      label: '# nutrients + %',
		      data: nutrientList,
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

		var myChart = new Chart(ctx, {
		  type: 'bar',
		  data: {
		    labels: [ "추천 칼로리", "섭취 칼로리"],
		    datasets: [{
		      label: '# Kcal',
		      data: [ recommendKcal , dayTotalKcal],
		      backgroundColor: [

		        'rgba(153, 102, 255, 0.2)',
		        'rgba(255, 159, 64, 0.2)',
		      ],
		      borderColor: [

		        'rgba(153, 102, 255, 1)',
		        'rgba(255, 159, 64, 1)',
		      ],
		      borderWidth: 3
		    }]
		  },
		  options: {
		    responsive: true,
		    maintainAspectRatio : false,
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
		          anchor: 'end',
		          borderWidth: 2,
		          align: 'start',
		          offset: 6,
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
		

		
	});
</script>
<%@ include file="../include/footer.jsp"%>
