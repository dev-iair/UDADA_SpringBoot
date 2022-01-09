<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>
<style>
.modalBtn {
  color: #939597;
}
.modalBtn:hover {
  color: #363945;
}
</style>

<div class="container">

	<form class="form-material" method="POST" action="/challenge/register" onsubmit="return checkForm()">
		<input type="hidden" name="mEmail" class="form-control" value="${loginUser}">

		<label>제목</label>
		<div class="form-group form-default">
			<input type="text" name="cTitle" id="cTitle" class="form-control" placeholder="5글자 이상">
		</div>
		<label>기간</label>
		<div class="form-group form-default flatpickr">
			<input type="text" name="cPeriod" id="cPeriod" class="selector form-control" placeholder="2주(14일) 이내">
		</div>
		<label>최대 인원</label>
		<div class="form-group form-default">
			<input type="number" name="cTotal" id="cTotal" class="form-control" placeholder="10명 이하">
		</div>

		<label>목표 운동 <i role="button" class="fas fa-plus-circle modalBtn"></i></label>

		
		<div class="form-group form-default" id="excsDiv">
		</div>
		<input type="hidden" id="excsCheckCnt" value="0">
		
		<label>상세 내용</label>
		<div class="form-group form-default">
		<textarea name="cContent" class="form-control" id="cContent" rows="10" placeholder="15글자 이상"></textarea>
		<br>
		</div>
		<div align="center">
		<input type="submit" class="btn btn-primary" value="등록">
		<input type="reset" class="btn btn-danger" value="취소">
		</div>
		<br>
	</form>
	

<!-- Modal -->

	<div class="modal" id="goalModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">운동 목표 추가</h5>
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
					<a class="btn btn-primary" id="excsAddBtn" >추가</a>
				</div>
			</div>
		</div>
	</div>
	
<script>

	function checkForm(){	
		var cnt=$("#excsCheckCnt").val();
		var btn=$(".modalBtn");
		var cTotal=$("#cTotal").val();
		var cContent=$("#cContent").val();
		var cTitle=$("#cTitle").val();
		var cPeriod=$("#cPeriod").val();
		var checkPeriod = 0;
		if(cPeriod.length<13 && cPeriod.length>1){
			checkPeriod=1;
		}else{
			var startDateStr=cPeriod.substring(0,10);
			var finishDateStr=cPeriod.substring(13,23);
			var startArray = startDateStr.split("-");          
			var finishArray = finishDateStr.split("-");
			var startDate = new Date(startArray[0], Number(startArray[1])-1, startArray[2]);   
			var finishDate = new Date(finishArray[0], Number(finishArray[1])-1, finishArray[2]);
			var betweenDay = (finishDate.getTime() - startDate.getTime())/1000/60/60/24; 
			if(betweenDay<14){
				checkPeriod=1;
			}
		}
		if(cnt>0 && cTotal>0 && cTotal<11 && cTitle.length>=5 && cContent.length>=15 && checkPeriod==1){	
			return true;
		}else{
			if(cnt<1){
				btn.css({"color": "red"});	
				setTimeout(function() { 
					btn.css({"color": ""});	
					}, 1000);
			}
			if(cTotal<1 || cTotal>10 || !cTotal){
				$("#cTotal").css({"border-color": "red"});	
				setTimeout(function() { 
					$("#cTotal").css({"border-color": ""});	
					}, 1000);
			}
			if(cTitle.length<5){
				$("#cTitle").css({"border-color": "red"});	
				setTimeout(function() { 
					$("#cTitle").css({"border-color": ""});	
					}, 1000);
			}
			
			if(cContent.length<15){
				$("#cContent").css({"border-color": "red"});	
				setTimeout(function() { 
					$("#cContent").css({"border-color": ""});	
					}, 1000);
			}
			
			if(checkPeriod==0){
				$("#cPeriod").css({"border-color": "red"});	
				setTimeout(function() { 
					$("#cPeriod").css({"border-color": ""});	
					}, 1000);
			}
			
			return false;
		}
	}

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
	                            "<input type='text' class='form-control' aria-describedby='btnAddon" + cnt + "' value='" + excs.ename + " (" + excs.ekcal + "kcal/5분)' readonly>" +
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
    	    
    	flatpickr.localize(flatpickr.l10ns.ko);

		$(".selector").flatpickr({
			disable : ["today"],
			mode : "range",
			minDate : "today",
			dateFormat : "Y-m-d",
		});
		
		var count = 1;
		var eCheckCnt=0;

		$("#excsAddBtn").on("click", function(e){
			var eNo = $("#excsSelNo").val();
			var cgTime = $("#excsSelTime").val();
			var eName = $("#excsSelName").val();
			var eKcal = $("#excsSelKcal").val();
			var totKcal = Math.round(eKcal*cgTime/5);	
			if(cgTime>=1 && !!cgTime){
				var str = "<div class='input-group mb-3 excsListDiv'>" +
                "<input type='text' class='form-control' aria-describedby='btnAddon"+count+"' value='"+eName+" "+cgTime+"분 ("+totKcal+"칼로리)' readonly disabled>" +
                "<button class='btn btn-outline-secondary delExcs' type='button'> " +
                "<i class='fas fa-minus'>" +
                "</i>" +
                "</button>" +
                "<input type='hidden' class='form-control' name='eNoArray' value='"+eNo+"'>" +
                "<input type='hidden' class='form-control' name='cgTimeArray' value='"+cgTime+"'>" +
                "</div>";
                
			$("#excsDiv").append(str);
			
			$("#goalModal").modal('hide');
			
			eCheckCnt++;
			
			$("#excsCheckCnt").val(eCheckCnt);
			count++;	
			}else{
				$("#excsSelTime").css({"border-color": "red"});	
				setTimeout(function() { 
					$("#excsSelTime").css({"border-color": ""});	
				}, 1000);
				}
		});
		
		$("#excsDiv").on("click","button",function(){
			$(this).closest("div").remove();
			eCheckCnt--;
			$("#excsCheckCnt").val(eCheckCnt);
		});
		
		
</script>

</div>
</div>

<!-- End of Main Content -->
<%@ include file="../include/footer.jsp"%>
