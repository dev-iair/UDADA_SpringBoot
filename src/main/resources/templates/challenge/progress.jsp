<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css">
<style>
.talkBtn {
  color: #939597;
}
.talkBtn:hover {
  color: #363945;
}
.talkContent:hover {
  background-color: #f0f0f0;
}
.linkBtn {
  color: #939597;
}
.linkBtn:hover {
  color: #363945;
}
.goalList a{
  color: #005780;
}
.goalList a i{
  color: #939597;
}
.goalList a:hover i{
  color: #363945;
}
.goalList a:hover {
  color: #005780;
  text-decoration: none;
}

#calendar a:hover{
	text-decoration: none !important
}
</style>
<c:choose>
<c:when test="${checkMem>0 && info.procDate>0}">
<div class="container-fluid">

	<div class="row">

		<div class="col-xl-4 mb-3">
			<div class="card border-left-primary shadow h-100">
				<div class="card-body pt-2 pb-3">
				<i role="button" onclick="location.href='/challenge/read/${info.CNo}'" style="float: right; padding-top: 10px;"
				class="fas fa-external-link-alt fa-sm linkBtn stretched-link"></i>
					<div class="row no-gutters align-items-center">
						<div class="col">
							<div
								class="text-lg font-weight-bold text-primary text-uppercase mb-0">
								제목</div>
							<div class="mb-0 text-lg font-weight-bold"
								style="text-align: center; color:#005780;">${info.CTitle}</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-xl-4 col-lg-6 mb-3">
			<div class="card border-left-primary shadow h-100">
				<div class="card-body pt-2 pb-3">
					<div class="row no-gutters align-items-center">
						<div class="col">
							<div
								class="text-lg font-weight-bold text-primary text-uppercase mb-0">
								기간</div>
							<div class="mb-0 text-lg font-weight-bold"
								style="text-align: center; color:#005780;">
								<fmt:formatDate value="${info.CStart}" pattern="yyyy-MM-dd" />
								~
								<fmt:formatDate value="${info.CFinish}" pattern="yyyy-MM-dd" />
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="col-xl-4 col-lg-6 mb-3">
			<div class="card border-left-primary shadow h-100">
				<div class="card-body pt-2 pb-3">
					<div class="row no-gutters align-items-center">
						<div class="col">
							<div
								class="text-lg font-weight-bold text-primary text-uppercase mb-0">
								운동</div>
							<div class="mb-0 text-lg font-weight-bold goalList"
								style="text-align: center; color:#005780;">
								<c:forEach var="goal" items="${info.goalList}" varStatus="i">
									<c:choose>
										<c:when test="${i.last}">
                                          		<a role="button" href="/exercise/read?eNo=${goal.ENo}">${goal.EName} ${goal.cgTime}분<i class="fas fa-external-link-alt ml-1" style="vertical-align: top; font-size: 0.5em;"></i></a> 
                                          		</c:when>
										<c:otherwise>
                                          		<a href="/exercise/read?eNo=${goal.ENo}">${goal.EName} ${goal.cgTime}분<i class="fas fa-external-link-alt ml-1" style="vertical-align: top; font-size: 0.5em;"></i>, </a>
                                          		</c:otherwise>
									</c:choose>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="col-xl-3 col-lg-6 mb-3">
			<div class="card border-left-success shadow h-100">
				<div class="card-body pt-3">
					<div class="row no-gutters align-items-center">
						<div class="col">
							<div
								class="text-lg font-weight-bold text-success text-uppercase mb-0">진행률
							</div>
							<div class="row no-gutters align-items-center">
								<div class="col-auto">
									<div class="mb-0 mr-3 text-lg font-weight-bold"
										style="text-align: center; color: #008c4e;">
										<c:choose>
											<c:when test="${info.progress<=100}">${info.progress}%</c:when>
											<c:otherwise>종료</c:otherwise>
										</c:choose>
									</div>
								</div>
								<div class="col">
									<div class="progress progress-sm mr-2">
										<div class="progress-bar bg-success progress-bar-striped progress-bar-animated" role="progressbar"
											style="width: <c:choose><c:when test="${info.progress<=100}">${info.progress}</c:when><c:otherwise>100</c:otherwise></c:choose>%"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-xl-3 col-lg-6 mb-3">
			<div class="card border-left-warning shadow h-100">
				<div class="card-body pt-3">
					<div class="row no-gutters align-items-center">
						<div class="col">
						<c:choose>
						<c:when test="${info.progress<=100}">							<div
								class="text-lg font-weight-bold text-warning text-uppercase mb-0">
								챌린지
								<div style="display: inline-block; color: #dc793a">${info.procDate}일
									째</div>
								날입니다<br>남은
								<div style="display: inline-block; color: #dc793a">${info.totalDate-info.procDate+1}일</div>
								힘내세요!
							</div></c:when>
						<c:otherwise>							
							<div class="text-lg font-weight-bold text-warning text-uppercase mb-0">
								챌린지 종료되었습니다<br>
								고생하셨습니다!
							</div></c:otherwise>
						</c:choose>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-xl-3 col-lg-6 mb-3">
			<div class="card border-left-info shadow h-100">
				<div class="card-body pt-3">
					<div class="row no-gutters align-items-center">
						<div class="col">
							<div
								class="text-lg font-weight-bold text-info text-uppercase mb-0">
								나의 성공률
								<div style="display: inline-block; color: #926aa6">
									<c:forEach var="mem" items="${mem}">
										<c:choose>
											<c:when test="${mem.MEmail==loginUser}">
												<fmt:formatNumber value="${(mem.success/info.procDate)*100}"
													pattern="0" />%</c:when>
										</c:choose>
									</c:forEach>
								</div>
								<br>챌린지 평균 성공률
								<div style="display: inline-block; color: #926aa6">
									<fmt:formatNumber
										value="${(info.totalScs/(info.procDate*info.memCnt))*100}"
										pattern="0" />%
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<c:choose>
		<c:when test="${info.progress<=100}">							
		<c:choose>
			<c:when test="${info.mySuccess>0}">
				<div class="col-xl-3 col-lg-6 mb-3">
					<div class="card border-left-success shadow h-100">
						<div class="card-body pt-3">
							<div class="row no-gutters align-items-center">
								<div class="col">
									<div
										class="text-lg font-weight-bold text-success text-uppercase mb-0">
										오늘 챌린지 성공!<br>충분한 휴식 잊지마세요
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<div class="col-xl-3 col-lg-6 mb-3">
					<div class="card border-left-danger shadow h-100">
						<div class="card-body pt-3">
							<div class="row no-gutters align-items-center">
								<div class="col">
								<i role="button" onclick="location.href='/exercise/mylist'" style="float: right; padding-top: 10px;"
								class="fas fa-external-link-alt fa-sm linkBtn stretched-link"></i>
									<div
										class="text-lg font-weight-bold text-danger text-uppercase mb-0">
										오늘은 아직?<br> 도전하고 등록하세요!
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
			</c:when>
			<c:otherwise>							
				<div class="col-xl-3 col-lg-6 mb-3">
					<div class="card border-left-success shadow h-100">
						<div class="card-body pt-3">
						<i role="button" onclick="location.href='/challenge/list'" style="float: right; padding-top: 10px;"
				class="fas fa-external-link-alt fa-sm linkBtn stretched-link"></i>
							<div class="row no-gutters align-items-center">
									<div class="text-lg font-weight-bold text-success text-uppercase mt-3">
										다른 챌린지에 도전하세요!
								</div>
							</div>
						</div>
					</div>
				</div>
						</c:otherwise>
						</c:choose>


	</div>



	<div class="row">
		
		<div class="col-xl-4 mb-3">

			<div class="card shadow mb-3">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">나의 챌린지 상황</h6>
				</div>
				<div class="card-body">
				<div id="calendar" style="font-size: 11px;"></div>
				</div>
			</div>
		</div>

		<div class="col-xl-5">
			<div class="card shadow mb-3">
				<div
					class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h6 class="m-0 font-weight-bold text-primary">챌린지 성공률 그래프</h6>
				</div>
				<div class="card-body" style="height: 220px">
						<canvas id="successRateChart"></canvas>
				</div>
			</div>
			<div class="card shadow mb-3">
				<div
					class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h6 class="m-0 font-weight-bold text-primary">멤버 성공 현황</h6>
				</div>
				<div class="card-body" style="height: 220px">
						<canvas id="memberSuccessCount"></canvas>
				</div>
			</div>
		</div>
		
		<div class="col-xl-3 mb-3">
			<div class="card shadow mb-3">
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">챌린지 톡</h6>
                                    <div>
                                        <a href="javascript:location.reload()">
                                            <i role="button" class="fas fa-sync-alt talkBtn"></i>
                                        </a>
                                    </div>
                                </div>
				<div class="card-body py-2" id="challengeTalkDiv" style="overflow:auto; height: 450px; ">
				<c:forEach var="talk" items="${talk}" varStatus="status">
					<div>

						<div style="display: inline-block; float: right; font-size: small;">
							<c:choose>
							<c:when test="${talk.MEmail==loginUser || loginUserRole=='ADMIN'}">
							<i role="button" class="far fa-edit talkEdit talkBtn"></i>
							<i role="button" data-re-no="${talk.reNo}" data-check-talk="0" class="far fa-trash-alt talkDel talkBtn"></i>
							</c:when>
							</c:choose>
						${talk.reDate}</div>
							<c:choose>
							<c:when test="${talk.MEmail==loginUser}">
							<div class="font-weight-bold text-primary mb-1" style="font-size: small;">
							${talk.MName}
							</div>
							</c:when>
							<c:otherwise>
							<div class="font-weight-bold mb-1" style="font-size: small;">
							${talk.MName}
							</div>
							</c:otherwise>
							</c:choose>
						<div data-re-no="${talk.reNo}" role="button" class="talkContent">${talk.reContent}</div>
					<div class="input-group talkModify" style="display: none;">
  					<textarea rows="1" class="form-control">${talk.reContent}</textarea>
  					<button data-re-no="${talk.reNo}" class="btn btn-outline-secondary applyEdit" type="button"><i class="fas fa-check"></i></button>
  					<button class="btn btn-outline-secondary btn-sm cancelEdit" type="button"><i class="fas fa-times"></i></button>
					</div>	
						<c:forEach var="reply" items="${talk.talkReply}">
						<div>
							<div style="display: flex; flex-wrap: wrap;" class="talkReply">		
							└&nbsp;<c:choose>
							<c:when test="${reply.MEmail==loginUser}">
							<div class="mt-1 col-auto px-0 mx-0 text-primary" style="font-size: small;">
							${reply.MName}
							</div>
							</c:when>
							<c:otherwise>
							<div class="mt-1 col-auto px-0 mx-0" style="font-size: small;">
							${reply.MName}
							</div>
							</c:otherwise>
							</c:choose>:
							<div class="mt-1 col px-0 mx-1" style="font-size: small;">
							${reply.reContent}
							</div>
							<div class="mt-1 col-auto px-0 mx-0" style="display: inline-block; text-align:right; font-size: x-small;">
								<c:choose>
								<c:when test="${reply.MEmail==loginUser || loginUserRole=='ADMIN'}">
								<i role="button" class="far fa-edit talkReplyEditBtn talkBtn"></i>
								<i role="button" data-re-no="${reply.reNo}" data-check-talk="1" class="far fa-trash-alt talkDel talkBtn"></i>
								</c:when>
								</c:choose>
							${reply.reDate}</div>
		  					</div>
		  					<div class="input-group talkReplyEdit" style="display: none;">
		  					<textarea rows="1" class="form-control">${reply.reContent}</textarea>
		  					<button data-re-no="${reply.reNo}" class="btn btn-outline-secondary applyEdit" type="button"><i class="fas fa-check"></i></button>
		  					<button class="btn btn-outline-secondary btn-sm reCancelEdit" type="button"><i class="fas fa-times"></i></button>
		  					</div>
		  					</div>
						</c:forEach>
						<div class="input-group talkReplyReg" style="display: none;">
  						<textarea rows="1" class="form-control" ></textarea>
  						<button class="btn btn-outline-secondary" id="talkReRegBtn" type="button"><i class="far fa-comment"></i></button>
  						<button class="btn btn-outline-secondary btn-sm cancelTalkReg" type="button"><i class="fas fa-times"></i></button>
						</div>
						<c:choose>
						<c:when test="${status.last}">
						</c:when>
						<c:otherwise>
						<hr class="my-2">
						</c:otherwise>
						</c:choose>

					</div>
				</c:forEach>
					
				</div>
				<div class="card-footer py-2 px-2">
					<div class="input-group" id="talkReg">
  					<textarea rows="1" class="form-control" ></textarea>
  					<button class="btn btn-outline-secondary" type="button"><i class="far fa-comment"></i></button>
				</div>
				
				</div>
			</div>
		</div>

	</div>

	</div>
	
</c:when>
<c:otherwise>
<script>
window.location.href = "/challenge/mychallenge";
</script>
</c:otherwise>
</c:choose>
</div>

<script>
$("#challengeTalkDiv").scrollTop($("#challengeTalkDiv")[0].scrollHeight);

var mySuccessDay = new Array();
var challengePeriod = {title:'챌린지 기간', start:"${info.charStart}", end:"${info.charFinish}"};
	$.ajax({
		type : "post",
		url : "/challenge/getMySuccessDay",
		data : {mEmail:"${loginUser}", cNo:${info.CNo} },
		dataType : "json",
		async:false,
		success:function(data){
			mySuccessDay = data;
			mySuccessDay.push(challengePeriod);
		}
	});
   var calendarEl = document.getElementById('calendar');
   var calendar = new FullCalendar.Calendar(calendarEl, {
     themeSystem: 'bootstrap',
     initialView: 'dayGridMonth',
     locale: 'ko',
     contentHeight: "auto",
     events: mySuccessDay    
   });
   calendar.render();
   calendar.gotoDate("${info.charStart}");
   $('#calendar').find("button").addClass("btn-sm");

   $("#talkReg").on("click","button",function(){
		var reContent = $("#talkReg").find("textarea").val();
		if(!reContent.trim()){
			$("#talkReg").find("textarea").css({"border-color": "red"});	
			setTimeout(function() { 
				$("#talkReg").find("textarea").css({"border-color": ""});	
				}, 1000);
		}else{
			$.ajax({
				type : "post",
				url : "/challenge/talkReg",
				data : {mEmail:"${loginUser}", oriNo:${info.CNo}, reContent:reContent, reIndent:0},
				dataType : "json",
				async:false
			});
			location.reload();
		}
	});


$(".talkReplyReg").on("click","#talkReRegBtn",function(){
	var reContent = $(this).parent().find("textarea").val();
	var groupNo = $(this).parent().parent().find(".talkContent").data("reNo")
	if(!reContent.trim()){
		var textarea = $(this).parent().find("textarea");
		textarea.css({"border-color": "red"});	
		setTimeout(function() { 
			textarea.css({"border-color": ""});	
			}, 1000);
	}else{
	$.ajax({
		type : "post",
		url : "/challenge/talkReg",
		data : {mEmail:"${loginUser}", oriNo:${info.CNo}, reContent:reContent, reIndent:1, groupNo:groupNo},
		dataType : "json",
		async:false
	});
	location.reload();
	}
});

$(".talkContent").on("click", function(){
	$(this).parent().find(".talkReplyReg").toggle();
});

$(".talkDel").on("click", function(){
	var data = $(this).data();
	$.ajax({
		type : "post",
		url : "/challenge/talkDel",
		data : data,
		dataType : "json",
		async:false
	});
	location.reload();
});

$(".talkEdit").on("click",function(){
	$(this).parent().parent().find(".talkModify").toggle();
	$(this).parent().parent().find(".talkContent").toggle();
});

$(".cancelEdit").on("click",function(){
	$(this).parent().parent().find(".talkModify").toggle();
	$(this).parent().parent().find(".talkContent").toggle();
});

$(".talkReplyEditBtn").on("click",function(){
	$(this).parent().parent().toggle();
	$(this).parent().parent().parent().find(".talkReplyEdit").toggle();
});

$(".reCancelEdit").on("click",function(){
	$(this).parent().toggle();
	$(this).parent().parent().find(".talkReply").toggle();
});

$(".cancelTalkReg").on("click",function(){
	$(this).parent().toggle();
});

	$(".talkModify").on("click",".applyEdit",function(){
	var reContent = $(this).parent().find("textarea").val();
	var reNo = $(this).data("reNo")
	if(!reContent.trim()){
		var textarea = $(this).parent().find("textarea");
		textarea.css({"border-color": "red"});	
		setTimeout(function() { 
			textarea.css({"border-color": ""});	
			}, 1000);
	}else{
	$.ajax({
		type : "post",
		url : "/challenge/talkEdit",
		data : {reNo:reNo, reContent:reContent},
		dataType : "json",
		async:false
	});
	location.reload();
	}
	});
	
	$(".talkReplyEdit").on("click",".applyEdit",function(){
		var reContent = $(this).parent().find("textarea").val();
		var reNo = $(this).data("reNo")
		if(!reContent.trim()){
			var textarea = $(this).parent().find("textarea");
			textarea.css({"border-color": "red"});	
			setTimeout(function() { 
				textarea.css({"border-color": ""});	
				}, 1000);
		}else{
		$.ajax({
			type : "post",
			url : "/challenge/talkEdit",
			data : {reNo:reNo, reContent:reContent},
			dataType : "json",
			async:false
		});
		location.reload();
		}
	});

Chart.defaults.global.defaultFontFamily = 'S-CoreDream-4Regular';
Chart.defaults.global.defaultFontColor = '#363945';
var chartLbl = new Array();
var chartDta = new Array();
/* <c:choose>
<c:when test="${info.procDate>7}">
<c:set var="chartBegin" value="${info.procDate-7}"></c:set>
</c:when>
<c:otherwise>
<c:set var="chartBegin" value="0"></c:set>
</c:otherwise>
</c:choose> */
<c:forEach items="${day}" var="day">
chartLbl.push("${day.period}");
chartDta.push(<fmt:formatNumber value="${(day.success/info.memCnt)*100}" pattern="0"/>);
</c:forEach>

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

var ctx = document.getElementById("successRateChart");
var myLineChart = new Chart(ctx, {
  type: 'line',
  data: {
    labels: chartLbl,
    datasets: [{
      label: "성공률",
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
          stepSize: 20,
          padding: 10,
          callback: function(value, index, values) {
            return number_format(value) + '%';
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
          return datasetLabel + ' : '+number_format(tooltipItem.yLabel) + '%';
        }
      }
    }
  }
});

var barLbl = new Array();
var barDta = new Array();

<c:forEach items="${mem}" var="mem">
barLbl.push("${mem.MName}");
barDta.push("${mem.success}");
</c:forEach>

var ctx = document.getElementById("memberSuccessCount");
var myBarChart = new Chart(ctx, {
  type: 'bar',
  data: {
    labels: barLbl,
    datasets: [{
      label: "성공 횟수",
      backgroundColor: "#007CB8",
      hoverBackgroundColor: "#007CB8",
      borderColor: "#007CB8",
      data: barDta,
      datalabels: {labels: {title: null}}
    }],
  },
  options: {
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
          maxTicksLimit: 10
        },
        maxBarThickness: 25,
      }],
      yAxes: [{
        ticks: {
          fontColor:"#363945",
          beginAtZero:true,
          stepSize: 2,
          maxTicksLimit: 15,
          padding: 10,

          callback: function(value, index, values) {
            return number_format(value)+'회';
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
      titleMarginBottom: 10,
      titleFontColor: '#363945',
      titleFontSize: 14,
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#363945",
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding: 15,
      yPadding: 15,
      displayColors: false,
      caretPadding: 10,
      callbacks: {
        label: function(tooltipItem, chart) {
          var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
          return datasetLabel + ' : ' + number_format(tooltipItem.yLabel) + ' 회 ';
        }
      }
    },
  }
});
</script>
<%@ include file="../include/footer.jsp"%>