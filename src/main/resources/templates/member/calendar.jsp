<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->

	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">지난 7일 총 칼로리 정보</h6>
		</div>
		<div class="card-body">
			<div>
				<canvas id="totalKcaloriesChart"></canvas>
			</div>
		</div>
	</div>
	
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">지난 7일 영양소 섭취 정보</h6>
		</div>
		<div class="card-body">
			<div>
				<canvas id="nutrientChart"></canvas>
			</div>
		</div>
	</div>
</div>


<script>
	$(document).ready(function() {
		
		var calendarDateList = []; 
		var totalKcalList = [];
		var nutrientList = [];
		var totalCarbo = 0;
		var totalProtein = 0;
		var totalFat = 0;
		var ctx = document.getElementById("totalKcaloriesChart").getContext('2d');
		var ctx2 = document.getElementById("nutrientChart");
		
		$.ajax({
				url:"/member/calendar",
			    method:"POST",
			    dataType:"json",		            
			    success:function(result){
					var arr = result;
					$.each(arr, function(idx, obj){
					console.log(obj);
					calendarDateList.push(obj.calendarDate);
					totalKcalList.push(obj.totalKcal);
					totalCarbo += obj.totalCarbo;
					totalProtein += obj.totalProtein;
					totalFat += obj.totalFat;
					

					console.log("nutrient>>", totalCarbo , totalProtein , totalFat);
					
			}); 
					var totalN = totalCarbo + totalProtein + totalFat ;
					totalCarbo = Math.round((totalCarbo/totalN)*100) ;
					totalProtein = Math.round((totalProtein/totalN)*100) ;
					totalFat = Math.round((totalFat/totalN)*100) ;
					nutrientList.push(totalCarbo,totalProtein,totalFat);
					console.log("nutrientList>>" ,nutrientList);

					
					
					var myChart2 = new Chart(ctx2, {
					  type: 'doughnut',
					  data: {
					    labels: ['탄수화물 % ', '단백질 % ', '지방 %'],
					    datasets: [{
					      label: '# 영양소 + %',
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
							maintainAspectRatio : true, // default value. false일 경우 포함된 div의 크기에 맞춰서 그려짐.
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
						type : 'line',
						data : {
							labels : calendarDateList,
							datasets : [ {
								label : '# 칼로리',
								data : totalKcalList,
								backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
										'rgba(54, 162, 235, 0.2)',
										'rgba(255, 206, 86, 0.2)',
										'rgba(75, 192, 192, 0.2)',
										'rgba(153, 102, 255, 0.2)',
										'rgba(255, 159, 64, 0.2)',
										'rgba(54, 162, 235, 0.2)' ],
								borderColor : [ 'rgba(255,99,132,1)',
										'rgba(54, 162, 235, 1)',
										'rgba(255, 206, 86, 1)',
										'rgba(75, 192, 192, 1)',
										'rgba(153, 102, 255, 1)',
										'rgba(255, 159, 64, 1)',
										'rgba(54, 162, 235, 0.2)' ],
								borderWidth : 3
							} ]
						},
						options : {
							maintainAspectRatio : true, // default value. false일 경우 포함된 div의 크기에 맞춰서 그려짐.
							scales : {
								yAxes : [ {
									ticks : {
										beginAtZero : true,
										
									}
								} ]
							},
					    plugins: {
					        datalabels: {
					          color: 'grey',
					          anchor: 'end',
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

						
					});//chart end

					
		},
			error: function(xhr,status,errorThrown){
				console.log("xhr >>",xhr);			
				}
		});

		

		


});
</script>
<!-- /.container-fluid -->
</div>
<!-- End of Main Content -->
<%@ include file="../include/footer.jsp"%>
