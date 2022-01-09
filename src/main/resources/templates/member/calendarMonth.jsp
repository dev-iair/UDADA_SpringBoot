<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<style>
.table thead.cal_date th button {
    font-size: 2rem;
    background: none;
    border: none;
}
.table thead.cal_week th {
   
    color: grey;
}
.table thead {
    
    color: grey;
}
.table tbody td {
    cursor: pointer;
}
.table tbody td:nth-child(1) {
    color: red;
}
.table tbody td:nth-child(7) {
    color: #288CFF;
}
.table tbody td.select_day {
    background-color: rgb(10,186,181,0.3);
    color: #fff;
}
</style>
<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">마이 월간 캘린더</h6>
		</div>
		<div class="card-body">
			<div id="calendarForm"></div>
		</div>
	</div>


</body>
</div>
<script>
/* (function () {
    calendarMaker($("#calendarForm"), new Date());
})(); */

$(document).ready(function(){
	(function () {
	    calendarMaker($("#calendarForm"), new Date());
	})();

	
	function showTotalKcal(year, month){
		var calendarDateList =[];
		var totalKcalList = [];
		month = (month+1)
		if(month/10<0){
			month = "0"+ String(month);
			}
		else if(month==13){
			month = "01";
			year = year +1;
			}
		else{
			month = String(month);
			}
		console.log("normalized month>>",month);

		var calendarDate = String(year) +"-" + month + "-01";
		$.ajax({
			url:"/member/calendarMonth",
		    method:"POST",
		    data : JSON.stringify({"calendarDate" : calendarDate}),
			contentType : "application/json; charset=utf-8",
		    dataType:"json",		            
		    success:function(result){
		    	var arr = result;
				$.each(arr, function(idx, obj){

					var dataMonth = Number((obj.calendarDate).substr(5,2));
					
					if(month=="01"){
						totalKcalList.push(obj.totalKcal);
						calendarDateList.push(obj.calendarDate);
						}
					else if(dataMonth!=(month-1)){
						
						}else{
							totalKcalList.push(obj.totalKcal);
							calendarDateList.push(obj.calendarDate);
							}
					
					
				}); //$.each end

				var today = new Date();
				
				for(var i = 0; i<calendarDateList.length ; i++){

					var isFutureDate = new Date(calendarDateList[i]);				
					if(!(today < isFutureDate)){

						var str = "";
						str += "<a href='/member/foodMy?day="+ calendarDateList[i] 
						str += "'><div><b class='text-center'>"+ totalKcalList[i] +"</b> Kcal</div></a>";
						$("td#"+(i+1)+"").append(str);
						}
					}
			
			},
			error: function(xhr,status,errorThrown){
				console.log("xhr >>",xhr);			
			}
		});

	}
	
	

var nowDate = new Date();

function calendarMaker(target, date) {
    if (date == null || date == undefined) {
        date = new Date();
    }
    nowDate = date;
    if ($(target).length > 0) {
        var year = nowDate.getFullYear();
        var month = nowDate.getMonth() + 1;
            
        $(target).empty().append(assembly(year, month));
    } else {
        console.error("calendar Target is empty!!!");
        return;
    }

    var thisMonth = new Date(nowDate.getFullYear(), nowDate.getMonth(), 1);
    var thisLastDay = new Date(nowDate.getFullYear(), nowDate.getMonth() + 1, 0);

    var tag = "<tr>";
    var cnt = 0;
    //빈 공백 만들어주기
    for (i = 0; i < thisMonth.getDay(); i++) {
        tag += "<td></td>";
        cnt++;
    }

    //날짜 채우기
    for (i = 1; i <= thisLastDay.getDate(); i++) {
        if (cnt % 7 == 0) { tag += "<tr>"; }

        tag += "<td id='"+ i +"'>" + i + "</td>";
        cnt++;
        if (cnt % 7 == 0) {
            tag += "</tr>";
        }
    }
    $(target).find("#custom_set_date").append(tag);
    calMoveEvtFn();

    function assembly(year, month) {

////////$$log/////////////////////////////////////////////////
showTotalKcal(year,month);
        
        var calendar_html_code =
            "<table class='table table-bordered ' width='100%' cellspacing='0'>" +
            "<colgroup>" +
            "<col style='width:81px'/>" +
            "<col style='width:81px'/>" +
            "<col style='width:81px'/>" +
            "<col style='width:81px'/>" +
            "<col style='width:81px'/>" +
            "<col style='width:81px'/>" +
            "<col style='width:81px'/>" +
            "</colgroup>" +
            "<thead class='text-center'  >" +
            "<th><button type='button' class='prev btn btn-secondary'><</button></th>" +
            "<th colspan='5'><h4><span>" + year + "</span>년 <span>" + month + "</span>월</h4></th>" +
            "<th><button type='button' class='next btn btn-secondary'>></button></th>" +
            "</thead>" +
            "<thead  class='cal_week'>" +
            "<th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th>" +
            "</thead>" +
            "<tbody id='custom_set_date'>" +
            "</tbody>" +
            "</table>";
        return calendar_html_code;
    }

    function calMoveEvtFn() {
        //전달 클릭
        $(".table").on("click", ".prev", function () {
            nowDate = new Date(nowDate.getFullYear(), nowDate.getMonth() - 1, nowDate.getDate());
            calendarMaker($(target), nowDate);
            

            
        });
        //다음날 클릭
        $(".table").on("click", ".next", function () {
            nowDate = new Date(nowDate.getFullYear(), nowDate.getMonth() + 1, nowDate.getDate());
            calendarMaker($(target), nowDate);
        });
        //일자 선택 클릭
        $(".table").on("click", "td", function () {
            $(".table .select_day").removeClass("select_day");
            $(this).removeClass("select_day").addClass("select_day");
        });
    }
}



});//document.ready end--


</script>

<!-- /.container-fluid -->
</div>
<!-- End of Main Content -->
<%@ include file="../include/footer.jsp"%>
