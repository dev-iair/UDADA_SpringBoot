<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css">
<!-- Begin Page Content -->

<style>
#calendar a:hover{
	text-decoration: none !important
}
</style>
<div class="container-fluid">

	<!-- Page Heading -->
	<div class="row">
	<div class="col-12">
	<div class="h3 mb-3 ml-3 font-weight-bold" style="vertical-align: middle">
	<div>
	마이 운동 <button class="btn btn-primary modalBtn btn mr-2" style="float: right;">마이운동 추가 <i class="fas fa-search"></i></button>
	</div>
	</div>
	</div>
				<div class="col-xl-12">
				<div class="card shadow mb-3">
				<div
					class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h6 class="m-0 font-weight-bold text-primary">최근 운동 그래프</h6>
				</div>
				<div class="card-body" style="height: 300px">
						<canvas id="memberSuccessCount"></canvas>
				</div>
			</div>
			</div>
	
			<div class="col-xl-6">
			<div class="card shadow mb-3">
				<div
					class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h6 class="m-0 font-weight-bold text-primary">운동 캘린더</h6>
				</div>
				<div class="card-body">
						<div id="calendar"></div>
				</div>
			</div>
		</div>
		<div class="col-xl-6">
		<div class="card shadow mb-3">
		<div class="card-body py-0">
			<table class="table table-hover mb-1 mt-3">
				<thead>
					<tr align="center">
						<th scope="col" >운동 내역</th>
						<th scope="col" >소모 칼로리</th>
						<th scope="col" >등록일</th>
						<th scope="col" style="width:10%">삭제</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach var="dto" items="${mylist}">
						<tr align="center">
							<th scope="row">
								${dto.EName} ${dto.emTime}분
										</th>
							<td><fmt:formatNumber value="${dto.emTime*dto.EKcal/5}"
									pattern="0" />칼로리</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
									value="${dto.emDate}" /></td>
							<td>
							<form class="emDel" method="post" action="/exercise/remove?emNo=${dto.emNo}">
							<input type="hidden" name="emNo">
							<button class="btn btn-danger btn-sm removeBtn">X</button>
							</form>
							</td>
						</tr>
						

					</c:forEach>
				</tbody>
			</table>
			<div class="row mx-2" style="justify-content:center;">
	<nav>
		<ul class="pagination">
			<li class="page-item ${exercisePageResultDTO.prev ? "":'disabled' }"><a
				class="page-link"
				href="/exercise/mylist?pageNum=${exercisePageResultDTO.exercisePageRequestDTO.pageNum-1}&keyword=${exercisePageResultDTO.exercisePageRequestDTO.keyword}"
				tabindex="-1" aria-disabled="true">&lt;</a></li>

			<c:forEach var="page" begin="${exercisePageResultDTO.start}"
				end="${exercisePageResultDTO.end }">
				<li
					class="page-item ${page==exercisePageResultDTO.exercisePageRequestDTO.pageNum? 'active' : '' }">
					<a class="page-link"
					href="/exercise/mylist?pageNum=${page}&keyword=${exercisePageResultDTO.exercisePageRequestDTO.keyword}">
						<c:out value="${page}" />
				</a>
				</li>
			</c:forEach>

			<li class="page-item ${exercisePageResultDTO.next ? "":'disabled' }"><a
				class="page-link"
				href="/exercise/mylist?pageNum=${exercisePageResultDTO.exercisePageRequestDTO.pageNum+1}&keyword=${exercisePageResultDTO.exercisePageRequestDTO.keyword}">&gt;</a>
			</li>
		</ul>
	</nav>
				<form action="/exercise/mylist" method="GET" id="searchForm"
		class="d-none d-sm-inline-block ml-2 form-inline navbar-search">
		<input type="hidden" class="form-control form-control-user"
			name="pageNum" value=${exercisePageResultDTO.exercisePageRequestDTO.pageNum } >

		<div class="input-group">
			<input type="text" class="form-control bg-light border- small"
				name="keyword" value="${exercisePageRequestDTO.keyword }"
				placeholder="검색" aria-label="Search"  style="width: 100px"
				aria-describedby="basic-addon2">
			<div class="input-group-append">
				<button class="btn btn-primary searchBtn" type="button">
					<i class="fas fa-search fa-sm"></i>
				</button>
			</div>
		</div>
	</form>
	</div>
	</div>
	</div>
	</div>

			
	</div>
			


</div>
</div>
<!-- End of Main Content -->
<div class="modal" id="msgModal" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Result</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
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
	<div class="modal" id="goalModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">오늘 운동 등록</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<label>운동</label>

						<div class="input-group mb-3">
							<input type="text" class="form-control searchInput" aria-describedby="btnAddon">
							<button class="btn btn-outline-secondary excsSearch" type="button" id="btnAddon"><i class="fa fa-search"></i></button>
						</div>
						<div class="input-group mb-3" id="getResultExcs">
						</div>
						<div id="excsTimeDiv">
						</div>
				
				</div>
				<div class="modal-footer">
					<a class="btn btn-primary" id="excsAddBtn" >등록</a>
				</div>
			</div>
		</div>
	</div>

<script>
	$(document).ready(function() {
		var msg = '${msg}';
		console.log("msg>>", msg);
		if (!(msg === '' || history.state)) {
			var modal = $("#msgModal");
			console.log(modal);
			modal.modal();
		}
		
	var searchForm = $("#searchForm");
	
	$("#searchForm button").on("click",function(e){

		searchForm.find("input[name='pageNum']").val(1);
		searchForm.submit();		
		});
	
	
	$(".removeBtn").on("click",function(e){
		e.preventDefault();
	if(confirm("삭제하시겠습니까? ")){
		$(this).parent().submit();
		}
		});
	
	});
	
	$(".modalBtn").on("click", function(){
        $("#goalModal").modal();   
        $("#getResultExcs").empty(); 
    	$("#excsTimeDiv").empty();
    	$("#excsAddBtn").hide();
    	$(".searchInput").val("");
    });

	$(".excsSearch").on("click", function(){
        	var excs = $(".searchInput").val();
        	var str = "";
	        $("#getResultExcs").empty();
	        $("#excsTimeDiv").empty();
        	$("#excsAddBtn").hide();
            $.ajax({
                type: "post",
                url: "/challenge/searchExcs",
                data: { eName: excs },
                dataType: "json",
                success: function (data) {
                    var cnt = 1;
                    if(data.length>0){
                    $.each(data, function (index, excs) {
                        str += "<div class='input-group mb-3'>" +
                            "<input type='text' class='form-control' aria-`describedby='btnAddon" + cnt + "' value='" + excs.ename + " (" + excs.ekcal + "kcal/5분)' readonly>" +
                            "<input type='hidden' class='form-control' id='excsSelNo' value='"+excs.eno+"' readonly>" +
                            "<input type='hidden' class='form-control' id='excsSelName' value='"+excs.ename+"' readonly>" +
                            "<input type='hidden' class='form-control' id='excsSelKcal' value='"+excs.ekcal+"' readonly>" +
                            "<button class='btn btn-outline-secondary' type='button' id='btnAddon" + cnt + "'> " +
                            "<i class='fas fa-check'>" +
                            "</i>" +
                            "</button>" +
                            "</div>";
                        cnt++;
                    });
                    $("#getResultExcs").append(str);
             	   }else{
                    str += "<div class='input-group mb-3'>" +
                    "<input type='text' class='form-control' value='검색 결과가 없습니다' disabled readonly>" +
                    "</div>";
                    $("#getResultExcs").append(str);
                }
                    },
                error: function () {
                }           
        });
    });
    	
	    $("#getResultExcs").on("click","button",function(){
	    	var str="";
	    	$(this).attr("class","btn btn-outline-success")
			var check = $(this).closest("div").clone();
			$("#excsTimeDiv").empty();
			$("#getResultExcs").empty();
			$("#getResultExcs").append(check);
			str+= "<label>시간(분)</label>" +
			"<input type='number' id='excsSelTime' class='form-control'>";
			$("#excsTimeDiv").append(str);
            $("#excsAddBtn").show();
	});	
	    
		$("#excsAddBtn").on("click", function(e){
			var eNo = $("#excsSelNo").val();
			var emTime = $("#excsSelTime").val();
			var mEmail = "${loginUser}";
			var exercise_myDTO = {
					"eNo" : eNo,
					"emTime" : emTime,
					"mEmail" : mEmail,
						}

			if(emTime>=1 && !!emTime){
				$.ajax({
					type : "post",
					url : "/exercise/insert",
					data : exercise_myDTO,
					dataType : "json",
					async:false
				});
				
				location.reload();
			}else{
				$("#excsSelTime").css({"border-color": "red"});	
				setTimeout(function() { 
					$("#excsSelTime").css({"border-color": ""});	
				}, 1000);
				}
		});

  var mySuccessDay = new Array();
	$.ajax({
		type : "post",
		url : "/exercise/getMyExcsList",
		data : {mEmail:"${loginUser}"},
		dataType : "json",
		async:false,
		success:function(data){
			mySuccessDay = data;
		}
	});
	console.log(mySuccessDay);
   var calendarEl = document.getElementById('calendar');
   var calendar = new FullCalendar.Calendar(calendarEl, {
     themeSystem: 'bootstrap',
     initialView: 'dayGridMonth',
     contentHeight:'auto',
     locale: 'ko',
     events: mySuccessDay
   });
   calendar.render();
   $('#calendar').find("button").addClass("btn-sm");
Chart.defaults.global.defaultFontFamily = 'S-CoreDream-4Regular';
Chart.defaults.global.defaultFontColor = '#363945';
var chartLbl = new Array();
var chartDta = new Array();
var i = 0;
 if(mySuccessDay.length>=14){
	i=(mySuccessDay.length-14);
} 
for(i; i<mySuccessDay.length; i++){
	var lbl = mySuccessDay[i].start;
	var dta = mySuccessDay[i].kcal;
	chartLbl.push(lbl);
	chartDta.push(dta);
}

console.log(chartDta);


function number_format(number, decimals, dec_point, thousands_sep) {

  number = (number + '').replace(',', '').replace(' ', '');
  var n = !isFinite(+number) ? 0 : +number,
    prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
    sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
    dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
    s = '',
    toFixedFix = function(n, prec) {
      var k = Math.pow(10, prec);
      return '' + Math.round(n * k) / k;
    };

  s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
  if (s[0].length > 3) {
    s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
  }
  if ((s[1] || '').length < prec) {
    s[1] = s[1] || '';
    s[1] += new Array(prec - s[1].length + 1).join('0');
  }
  return s.join(dec);
}

var ctx = document.getElementById("memberSuccessCount");
var myLineChart = new Chart(ctx, {
  type: 'line',
  data: {
    labels: chartLbl,
    datasets: [{
      label: "소모 칼로리",
      lineTension: 0.3,
      backgroundColor: "rgba( 255, 255, 255, 0.5 )",
      borderColor: "#007CB8",
      pointRadius: 3,
      pointBackgroundColor: "#007CB8",
      pointBorderColor: "#007CB8",
      pointHoverRadius: 3,
      pointHoverBackgroundColor: "#007CB8",
      pointHoverBorderColor: "#007CB8",
      pointHitRadius: 10,
      pointBorderWidth: 2,
      data: chartDta,
      datalabels: {labels: {title: null}}
    }],
  },
  options: {
	responsive: true,
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
        gridLines: {
          display: false,
          drawBorder: false
        },
        ticks: {
      	  fontColor:"#363945",
          maxTicksLimit: 15
        }
      }],
      yAxes: [{
        ticks: {
      	  fontColor:"#363945",
          beginAtZero:true,
          padding: 10,
          maxTicksLimit: 5,
          callback: function(value, index, values) {
            return number_format(value) + 'kcal';
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
      bodyFontColor: "#363945",
      titleMarginBottom: 10,
      titleFontColor: '#363945',
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
          return datasetLabel + ' : '+number_format(tooltipItem.yLabel) + 'kcal';
        }
      }
    }
  }
});
</script>
<%@ include file="../include/footer.jsp"%>
	
