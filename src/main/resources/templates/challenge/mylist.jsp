<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>


<!-- Begin Page Content -->

<div class="container-fluid">

<form class="row mb-4 my-1" name="searchBox" method="get" action="">
		<div class="col-lg-3 my-1">
			<div class="input-group">
  			<span class="input-group-text"><i class="fas fa-fw fa-font"></i></span>
 			<input type="text" name="keyword" class="form-control" placeholder="제목+내용">
			</div>
		</div>
		<div class="col-lg-3 my-1">
			<div class="input-group">
  			<span class="input-group-text"><i class="far fa-fw fa-calendar-alt"></i></span>
 			<input type="text" name="period" class="form-control selector" readonly placeholder="진행 기간">
			</div>
		</div>
		<div class="col-lg-2 my-1">
			<div class="input-group">
  			<span class="input-group-text"><i class="fas fa-fw fa-dumbbell"></i></span>
 			<input type="text" name="exercise" class="form-control" placeholder="운동 이름">
			</div>
		</div>
		<div class="col-lg-2 col-6 my-1">
			<button type="submit" class="btn btn-outline-secondary"><i class="fas fa-fw fa-search"></i></button>
		</div>
			<input type="hidden" name=pageNo value=1>
		<div class="col-lg-2 col-6 my-1" style="text-align:right">
		<button type="button" class="btn btn-success" disabled><sec:authentication property="principal.memberDTO.mName" />님의 챌린지</button>

	    </div>
			
</form>

<hr class="mb-4">
	<div class="row">
		<c:forEach var="dto" items="${list}">
			<div class="col-xl-4 col-md-6 mb-4">
				<div class="card border-left-${dto.CIng} shadow h-100 py-2">
					<div class="row no-gutters align-items-center">
						<div class="col py-3 pl-3 pr-2 d-flex flex-column position-static">
							<strong class="d-inline-block mb-1 text-${dto.CIng}"><fmt:formatDate value="${dto.CStart}" pattern="yy.MM.dd" />
								-
								<fmt:formatDate value="${dto.CFinish}" pattern="yy.MM.dd" /></strong>
							<h4 class="my-2">${dto.CTitle}</h4>
							<c:forEach var="goal" items="${dto.GList}">
							<p class="mb-auto">${goal.EName} ${goal.cgTime}분</p>
							</c:forEach>
							<c:choose>
							<c:when test="${dto.CIng=='primary'}">
							<a href="read/${dto.CNo}" class="stretched-link"></a>
							</c:when>
							<c:otherwise>
							<a href="progress/${dto.CNo}" class="stretched-link"></a>
							</c:otherwise>
							</c:choose>
						</div>
						<div class="col-auto mr-4">
							<p class="mb-auto">${dto.caCnt}명/ ${dto.CTotal}명</p>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>


	</div>


	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			<c:set var="pageNo" value="${page.pageNo}" />
			<c:choose>
				<c:when test="${checkEnd==true}">
					<c:set var="endPage" value="${page.startPage+4}" />
				</c:when>
				<c:otherwise>
					<c:set var="endPage" value="${page.endPage}" />
				</c:otherwise>
			</c:choose>
			<c:if test="${pageNo>5}">
				<li class="page-item"><a class="page-link" href="mylist?keyword=${page.keyword}&period=${page.period}&excercise=${page.exercise}&pageNo=1"
					aria-label="Previous"> <span aria-hidden="true">&#171;</span>
				</a></li>
				<li class="page-item"><a class="page-link" href="mylist?keyword=${page.keyword}&period=${page.period}&excercise=${page.exercise}&pageNo=${pageNo-1}">&#60;</a></li>
			</c:if>
			<c:forEach var="pageNo" begin="${page.startPage}" end="${endPage}">
				<c:choose>
				<c:when test="${pageNo!=page.pageNo}">
				<li class="page-item"><a class="page-link" href="mylist?keyword=${page.keyword}&period=${page.period}&excercise=${page.exercise}&pageNo=${pageNo}">${pageNo}</a></li>
				</c:when>
				<c:otherwise>
				<li class="page-item disabled"><a class="page-link" href="mylist?keyword=${page.keyword}&period=${page.period}&excercise=${page.exercise}&pageNo=${pageNo}">${pageNo}</a></li>
				</c:otherwise>
			</c:choose>
			</c:forEach>
			<c:if test="${checkEnd==true}">
				<li class="page-item"><a class="page-link" href="mylist?keyword=${page.keyword}&period=${page.period}&excercise=${page.exercise}&pageNo=${pageNo+1}">&#62;</a></li>
				<li class="page-item"><a class="page-link"
					href="mylist?pageNo=${page.endPage}" aria-label="Next"> <span
						aria-hidden="true">&#187;</span>
				</a></li>
			</c:if>
		</ul>
	</nav>

</div>
</div>
<script>

	flatpickr.localize(flatpickr.l10ns.ko);
	
	$(".selector").flatpickr({
		mode : "range",
		dateFormat : "Y-m-d"
	});
</script>
<!-- End of Main Content -->
<%@ include file="../include/footer.jsp"%>



