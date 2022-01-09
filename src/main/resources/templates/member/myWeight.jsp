<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
<h1 class="h3 mb-4 text-gray-800">체중 재기</h1>
<form action="/member/insertWeight" method="post">
	<input type="hidden" name="mEmail" id="mEmail" value="${dto.MEmail}">
		<table style="width:100%;">
			<tr>
				<td>키</td>
				<td>현재 체중</td>
				<td>목표 체중</td>
			</tr>
			<tr>
				<td><input type="text" name="msHeight" id="msHeight" class="form-control form-control-user" value="${dto.msHeight}" required></td>
				<td><input type="text" name="msWeight" id="msWeight" class="form-control form-control-user" value="${dto.msWeight}" required></td>
				<td><input type="text" name="msGoal" id="msGoal" class="form-control form-control-user" value="${dto.msGoal}" required></td>
			</tr>
			<tr>
				<td colspan="3"><input type="submit" value="체중 등록" id="submit" name="submit" class="btn btn-facebook btn-block"></td>
			</tr>
		</table>
</form>

<hr>

	<div class="col-xl-12 col-lg-7">
		<!-- Area Chart -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">체중 기록 그래프</h6>
			</div>
			<div class="card-body">
				<div class="chart-area">
					<canvas id="myWeightChart" style="height: 100%; width: 100%;"></canvas>
				</div>
			</div>
		</div>
	</div>
	<!-- Content Row -->
	
	
<hr>
		<!-- /.container-fluid -->
	<div class="col-xl-12">
		<div class="row" style="width: 100%; text-align: center;">
			<c:forEach var="dto" items="${list }">
				<div class="col-lg-12">
					<div class="card  mb-2 border-left-primary">
						<div class="card-body">
							<table style="width: 100%; text-align: center;">
								<tr>
									<th>날짜</th>
									<th>키</th>
									<th>현재 체중</th>
									<th>목표 체중</th>
									<th rowspan="2"><a
										href="/member/deleteWeight?msNo=${dto.msNo }"
										class="btn btn-danger"><span class="text">삭제하기</span></a></th>
								</tr>
								<tr>
									<td><fmt:formatDate pattern="yyyy-MM-dd"
											value="${dto.msDate }" /></td>
									<td>${dto.msHeight }</td>
									<td>${dto.msWeight }</td>
									<td>${dto.msGoal }</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	<c:if test="${not empty list}">
		<div class="row justify-content-center">
			<nav>
				<ul class="pagination">
					<li class="page-item ${pageResultDTO.prev ? "":'disabled' }">
						<a class="page-link" href="/member/myWeight?pageNum=${pageResultDTO.pageRequestDTO.pageNum-1}&mEmail=${dto.MEmail}"
							tabindex="-1" aria-disabled="true">Prev</a>
					</li>

					<c:forEach var="page" begin="${pageResultDTO.start}" end="${pageResultDTO.end }">
						<li class="page-item ${page==pageResultDTO.pageRequestDTO.pageNum? 'active' : '' }">
							<a class="page-link" href="/member/myWeight?pageNum=${page}&mEmail=${dto.MEmail}">
								<c:out value="${page}" />
							</a>
						</li>
					</c:forEach>

					<li class="page-item ${pageResultDTO.next ? "":'disabled' }">
					<a class="page-link" href="/member/myWeight?pageNum=${pageResultDTO.pageRequestDTO.pageNum+1}&mEmail=${dto.MEmail}">Next</a>
					</li>
				</ul>
			</nav>
		</div>
	</c:if>
		<!-- /.container-fluid -->
	</div>
</div>
	
	<script>
	
	$(document).ready(function() {
		
		var jsonData = ${json};
		var jsonObject = JSON.stringify(jsonData);
		var jData = JSON.parse(jsonObject);
		
		var labelList = new Array();
		var valueList = new Array();
		var lineList = new Array();
		//var colorList = new Array();
		
		for(var i=0; i<jData.length; i++){
			var d = jData[i];
			labelList.push(d.msDateStr);
			valueList.push(d.msWeight);
			lineList.push(d.msGoal);
			//colorList.push(colorize());
		}
		
		var data = {
				labels : labelList,
				datasets : [{
					  label: "체중",
					  lineTension: 0.3,
					  backgroundColor: "rgba(130, 216, 204, 0.05)",
					  borderColor: "rgba(130, 216, 204, 1)",
					  pointRadius: 3,
					  pointBackgroundColor: "rgba(130, 216, 204, 1)",
					  pointBorderColor: "rgba(130, 216, 204, 1)",
					  pointHoverRadius: 3,
					  pointHoverBackgroundColor: "rgba(130, 216, 204, 1)",
					  pointHoverBorderColor: "rgba(130, 216, 204, 1)",
					  pointHitRadius: 10,
					  pointBorderWidth: 2,
					  data : valueList
				},{
					   label: "목표체중",
					   lineTension: 0.3,
					   backgroundColor: "rgba(221, 136, 122, 0.05)",
					   borderColor: "rgba(221, 136, 122, 1)",
					   pointRadius: 3,
					   pointBackgroundColor: "rgba(221, 136, 122, 1)",
					   pointBorderColor: "rgba(221, 136, 122, 1)",
					   pointHoverRadius: 3,
					   pointHoverBackgroundColor: "rgba(221, 136, 122, 1)",
					   pointHoverBorderColor: "rgba(221, 136, 122, 1)",
					   pointHitRadius: 10,
					   pointBorderWidth: 2,
					   data : lineList
				}],
				options : {
					maintainAspectRatio: false,
					layout: {
						padding: {
							left: 10,
							right: 25,
							top: 25,
							bottom: 0
						}
					},
				    scales: {
				        xAxes: [{
				          type: 'time',
				          time: {
				            unit: 'day'
				          },
				          gridLines: {
				            display: false,
				            drawBorder: false
				          },
				          ticks: {
				            maxTicksLimit: 7
				          }
				        }],
				        yAxes: [{
				          ticks: {
				            maxTicksLimit: 5,
				            padding: 10,
				            // Include a dollar sign in the ticks
				            callback: function(value, index, values) {
				              return number_format(value) + 'kg';
				            }
				          },
				          gridLines: {
				            color: "rgb(234, 236, 244)",
				            zeroLineColor: "rgb(234, 236, 244)",
				            drawBorder: false,
				            borderDash: [2],
				            zeroLineBorderDash: [2]
				          }
				        }],
				      },
				      legend: {
				        display: false
				      },
				      tooltips: {
				        backgroundColor: "rgb(255,255,255)",
				        bodyFontColor: "#858796",
				        titleMarginBottom: 10,
				        titleFontColor: '#6e707e',
				        titleFontSize: 14,
				        borderColor: '#dddfeb',
				        borderWidth: 1,
				        xPadding: 15,
				        yPadding: 15,
				        displayColors: false,
				        intersect: false,
				        mode: 'index',
				        caretPadding: 10,
				        callbacks: {
				          label: function(tooltipItem, chart) {
				            var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
				            return datasetLabel + number_format(tooltipItem.yLabel) + 'kcal';
				          }
				        }
				      }
				}
		};

		var ct = document.getElementById("myWeightChart").getContext('2d');
		var myLineChart = new Chart(ct, {
			type: 'line',
			data: data
		});
		

		var msg = '${msg}';
		console.log("msg>>", msg);
		if (!(msg === '' || history.state)) {
			var modal = $(".modal");
			console.log(modal);
			modal.modal();
		}
		
	});

	$("#submit").on("click", function(){
		if($("#msHeight").val() == ""){
			alert("키를 입력해주세요.")
			$("#msHeight").focus();
			return false;
		}
		
		if($("#msWeight").val() == ""){
			alert("체중을 입력해주세요.")
			$("#msWeight").focus();
			return false;
		}
		
		if($("#msGoal").val() == ""){
			alert("목표 체중을 입력해주세요.")
			$("#msGoal").focus();
			return false;
		}
	});
	

</script>
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

<!-- End of Main Content -->
<%@ include file="../include/footer.jsp"%>
