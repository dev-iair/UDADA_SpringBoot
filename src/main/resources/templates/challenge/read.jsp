<%@page import="org.ourapp.udada.challenge.ChallengeGoalDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
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
</style>

<div class="container" style="max-width: 900px; margin-top: 30px; margin-bottom: 30px">
	<div class="col-md-12"></div>
	<form class="form-material" method="POST">
	<div class="row">
						<div class="col-lg-9 mb-4">
                            <div class="card shadow h-100 py-2">
                                <div class="card-body py-2">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col">
                                            <div class="text-sm font-weight-bold text-primary text-uppercase mb-1">
                                                제목</div>
                                            <div class="h5 mb-0 font-weight-bold">${dto.CTitle}</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 mb-4">
                            <div class="card shadow h-100 py-2">
                                <div class="card-body py-2">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col">
                                            <div class="text-sm font-weight-bold text-primary text-uppercase mb-1">
                                                신청 현황</div>
                                            <div class="h5 mb-0 font-weight-bold">${dto.caCnt}명 / ${dto.CTotal}명</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 mb-4">
                            <div class="card shadow h-100 py-2">
                                <div class="card-body py-2">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col">
                                            <div class="text-sm font-weight-bold text-primary text-uppercase mb-1">
                                                기간</div>
                                            <div class="h5 mb-0" id="todayEndCHG"><fmt:formatDate value="${dto.CStart}" pattern="yyyy-MM-dd" /> ~ <fmt:formatDate value="${dto.CFinish}" pattern="yyyy-MM-dd" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                       
                        <div class="col-12 mb-4">
                            <div class="card shadow h-100 py-2">
                                <div class="card-body py-2">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col">
                                            <div class="text-sm font-weight-bold text-primary text-uppercase mb-1">
                                                목표 운동</div>
                                            <div class="h5 mb-0">
                                            <c:forEach var="goal" items="${goal}" varStatus="status">
                                            <div class="my-1 goalList">
											<a role="button" href="/exercise/read?eNo=${goal.ENo}">
											${status.count}. ${goal.EName} ${goal.cgTime}분 &nbsp;(<fmt:formatNumber value="${goal.cgTime/5*goal.EKcal}" pattern="0" />칼로리)<i class="fas fa-external-link-alt ml-1" style="vertical-align: top; font-size: 0.5em;"></i>
											</a>
                                            </div>
                                            </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-12 mb-4">
                            <div class="card shadow h-100 py-2">
                                <div class="card-body pt-2" style="min-height: 300px">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col">
                                            <div class="text-sm font-weight-bold text-primary text-uppercase mb-1">
                                                상세 내용</div>
                                            <div class="h5 mb-0">
                                            ${dto.CContent}
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
	</div>

			<input type="hidden" name="mEmail" id="mEmail" class="form-control" value="${dto.MEmail}" readonly >
			<input type="hidden" name="cTitle" class="form-control" value="${dto.CTitle}" readonly >
		<div style="float:right; margin-bottom: 30px">
		<input type="button" class="btn btn-secondary" onclick="location.href='/challenge/list'" value="목록">
		</div>
		<div align="center">
		<sec:authorize access="isAuthenticated()">
		<input type="hidden" name="cNo" value="${dto.CNo}">
		<c:if test="${loginUser ne dto.MEmail && loginUserRole ne 'ADMIN'}">
			<c:if test="${dto.caCnt<dto.CTotal}">
		<input type="button" class="btn btn-primary" id="applyChallenge" style="display: none;" value="신청">
			</c:if>
		<input type="button" class="btn btn-danger" id="cancelChallenge" style="display: none;" value="신청취소">
			<c:if test="${dto.caCnt eq dto.CTotal}">
		<input type="button" class="btn btn-outline-danger" disabled value="마감된 챌린지">
			</c:if>
			<c:if test="${dto.checkEnd>=0}">
        <input type="button" class="btn btn-outline-danger" disabled value="시작된 챌린지 (신청취소 불가)">
        	</c:if>
		</c:if>

		<c:if test="${loginUser eq dto.MEmail || loginUserRole eq 'ADMIN'}">
		<input type="button" class="btn btn-warning" id="modifyChallenge" style="display: none;" value="수정" onclick="modify()">
		<input type="button" class="btn btn-danger" id="delBtn" style="display: none;" value="삭제">
		<c:if test="${dto.checkEnd>=0}">
        <input type="button" class="btn btn-outline-danger" disabled value="시작 된 챌린지 (수정, 삭제 불가)">
        </c:if>
		</c:if>
		</sec:authorize>
		</div>
	</form>
</div>
</div>
	
	<form name="cnoForm" method="post" action="/challenge/edit">
	<input type="hidden" name="cNo" value="${dto.CNo}">
	</form>
<script type="text/javascript">

	$(document).ready( function(e){	
		var uEmail = "${loginUser}";
		var applyCheck = 0;
		$.ajax({
			type : "post",
			url : "/challenge/applyCheck",
			data : {sEmail:uEmail, cNo:${dto.CNo}},
			dataType : "json",
			async:false,
			success :
				function(data){
					if(data>0){
						applyCheck=1;
					}else{
						applyCheck=0;
					}
				}
		});
	
		if(${dto.checkEnd}<0 || "${loginUserRole}" == "ADMIN"){
			if(applyCheck==1){
				$("#cancelChallenge").show();
			}
			$("#modifyChallenge").show();
			$("#delBtn").show();
		}
		if(${dto.checkEnd}<=0){
			if(applyCheck==0){
				$("#applyChallenge").show();

			}
		}
	});
	
	function modify() {
		var cnoForm = document.cnoForm;
		cnoForm.submit();
	}
	
	$("#delBtn").one("click", function() {
		$.post("/challenge/delete",{cNo : "${dto.CNo}"});
		window.location.href = "/challenge/list";
		  });

	$("#applyChallenge").one("click", function(e) {
		var uEmail = "${loginUser}";
		$.ajax({
			type : "post",
			url : "/challenge/apply",
			data : {sEmail:uEmail, cNo:${dto.CNo}},
			dataType : "json",
			success :
				function(){
				$("#applyChallenge").hide();
				$("#cancelChallenge").show();
				location.reload();
				}
		});
	});

	$("#cancelChallenge").one("click", function(e) {
		var uEmail = "${loginUser}";
		$.ajax({
			type : "post",
			url : "/challenge/cancel",
			data : {sEmail:uEmail, cNo:${dto.CNo}},
			dataType : "json",
			success :
				function(){
				$("#applyChallenge").show();
				$("#cancelChallenge").hide();
				location.reload();
				}
		});
	});
</script>
<!-- End of Main Content -->
<%@ include file="../include/footer.jsp"%>
