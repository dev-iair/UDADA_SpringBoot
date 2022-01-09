<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- Begin Page Content -->

<div class="container-fluid">

	<div class="row">
	<c:choose>
	<c:when test="${empty foodKcal.dayTotalDTO.dayTotalKcal}">
		<div class="col-xl-4 col-md-6 mb-4">
			<div class="card border-left-danger shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div class="h6 mb-0 font-weight-bold text-danger">
							오늘은 어떤 음식을 드셨나요?<br>
							오늘 먹은 음식을 기록하세요 <i role="button" class="fas fa-arrow-right stretched-link" 
							onclick="location.href='/member/foodMy'"></i>
							</div>
						</div>
						<div class="col-auto">
							<i class="fas fa-utensils fa-2x text-danger"></i>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:when>
	<c:otherwise>
		<div class="col-xl-4 col-md-6 mb-4">
			<div class="card border-left-primary shadow h-100 py-2">
				<div class="card-body">
				<a class="stretched-link" role="button" 
							onclick="location.href='/member/foodMy'"></a>
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div class="h5 mb-0 font-weight-bold text-primary">
							오늘 섭취한 칼로리는<br>
							<div style="color:#005780; display: inline-block;">${foodKcal.dayTotalDTO.dayTotalKcal}칼로리</div> 입니다 
							</div>
						</div>
						<div class="col-auto">
							<i class="fas fa-utensils fa-2x text-primary"></i>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:otherwise>
	</c:choose>

		<c:choose>
		<c:when test="${getMyExcs==0 || getMyExcs==null}">
		<div class="col-xl-4 col-md-6 mb-4">
			<div class="card border-left-danger shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div class="h6 mb-0 font-weight-bold text-danger">
							오늘은 어떤 운동을 하셨나요?<br>
							오늘 하신 운동을 기록하세요 <i class="fas fa-arrow-right stretched-link" role="button" 
							onclick="location.href='/exercise/mylist'"></i>
							</div>
						</div>
						<div class="col-auto">
							<i class="fas fa-running fa-2x text-danger"></i>
						</div>
					</div>
				</div>
			</div>
		</div>
		</c:when>
		<c:otherwise>
		<div class="col-xl-4 col-md-6 mb-4">
			<div class="card border-left-primary shadow h-100 py-2">
				<div class="card-body">
					<a class="stretched-link" role="button" onclick="location.href='/exercise/mylist'"></a>
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div class="h5 mb-0 font-weight-bold text-primary">
							오늘 운동으로 소모한 칼로리는<br>
							<div style="color:#005780; display: inline-block;">${getMyExcs}칼로리</div> 입니다
							</div>
						</div>
						<div class="col-auto">
							<i class="fas fa-running fa-2x text-primary"></i>
						</div>
					</div>
				</div>
			</div>
		</div>
		</c:otherwise>
		</c:choose>
		
		<c:choose>
		<c:when test="${getBmi==0 || getBmi==null}">
				<div class="col-xl-4 col-md-6 mb-4">
			<div class="card border-left-danger shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div class="h6 mb-0 font-weight-bold text-danger">
							다이어트 중이신가요?<br>
							체중을 기록해 보세요 <i class="fas fa-arrow-right stretched-link" role="button" 
							onclick="location.href='/member/myWeight'"></i>
							</div>
						</div>
						<div class="col-auto">
							<i class="fas fa-weight fa-2x text-danger"></i>
						</div>
					</div>
				</div>
			</div>
		</div>
				</c:when>
		<c:otherwise>
						<div class="col-xl-4 col-md-6 mb-4">
			<div class="card border-left-primary shadow h-100 py-2">
				<div class="card-body">
				<a class="stretched-link" role="button" onclick="location.href='/member/myWeight'"></a>
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div class="h5 mb-0 font-weight-bold text-primary">
							현재 BMI는
							<div style="color:#005780; display: inline-block;">
							${getBmi} (
							<c:choose>
							<c:when test="${getBmi<18.5}">
							저체중
							</c:when>
							<c:when test="${getBmi>=18.5 && getBmi<23}">
							정상
							</c:when>
							<c:when test="${getBmi>=23 && getBmi<25}">
							과체중
							</c:when>
							<c:when test="${getBmi>=25 && getBmi<30}">
							경도 비만
							</c:when>
							<c:when test="${getBmi>=30 && getBmi<35}">
							중도 비만
							</c:when>
							<c:when test="${getBmi>=35}">
							고도 비만
							</c:when>
							</c:choose>
							</div>
							) 입니다.
							</div>
						</div>
						<div class="col-auto">
							<i class="fas fa-weight fa-2x text-primary"></i>
						</div>
					</div>
				</div>
			</div>
		</div>
		</c:otherwise>

		</c:choose>

	</div>

	<div class="row">
		<div class="col-lg-5 mb-3">
			<div class="card shadow mb-3">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">인기 저널 (7일)</h6>
				</div>
				<div class="card-body">
				<c:forEach var="jList" items="${jList}">
					<div class="my-2">
						<div class="card shadow h-100">
							<div class="card-body py-2">
								<div class="row no-gutters align-items-center">
									<div class="col">
										<div class="mb-0 mt-2 font-weight-bold">
										@${jList.MName} : ${jList.JContent}... 
										<button class="btn btn-outline-info btm-sm stretched-link" onclick="location.href='/journal/list?pageNum=1&keyword=${fn:substring(jList.JContent,0,10)}'" style="float: right;" ><i class="fas fa-heart">
										</i> + ${jList.LCnt}</button>
										</div>
									</div>

								</div>
							</div>
						</div>
					</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<div class="col-lg-4 mb-3">
			<div class="card shadow mb-3">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">곧 마감되는 챌린지</h6>
				</div>
				<div class="card-body">
				<c:forEach var="cList" items="${cList}">
					<div class="my-2">
						<div class="card shadow h-100">
							<div class="card-body py-2">
								<div class="row no-gutters align-items-center">
									<div class="col">
										<div class="mb-0 mt-2 font-weight-bold">
										${cList.CTitle}
										<button class="btn btn-outline-warning btm-sm stretched-link" onclick="location.href='/challenge/read/${cList.CNo}'" style="float: right;" >
										<i class="fas fa-user-clock"></i> ${cList.CCount}명, ${cList.DDay}일 남음</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<div class="col-lg-3 mb-3">
			<div class="card shadow mb-3">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">인기 레시피 (30일)</h6>
				</div>
				<div class="card-body">
				<c:forEach var="rList" items="${rList}">
					<div class="my-2">
						<div class="card shadow h-100">
							<div class="card-body py-2">
								<div class="row no-gutters align-items-center">
									<div class="col">
										<div class="mb-0 mt-2 font-weight-bold">
										${rList.RTitle}
										<button class="btn btn-outline-success btm-sm stretched-link" onclick="location.href='/recipe/read?rNo=${rList.RNo}'" style="float: right;" >
										<i class="fas fa-star"></i> ${rList.rgAvg}</button>
										</div>
									</div>

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
        <div class="modal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">결과</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        ${msg }
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
                    </div>
                </div>
            </div>
        </div>
<!-- /.container-fluid -->
</div>
<!-- End of Main Content -->
<script>
$(document).ready(function(){

	var msg = '${msg}';

	if (!(msg===''||history.state)){
		var modal= $(".modal");
		console.log(modal);	
		modal.modal();
	}
});
</script>
<%@ include file="include/footer.jsp"%>
