<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib  prefix="sec" uri="http://www.springframework.org/security/tags" %>
<% response.setHeader("Cache-Control","no-store"); response.setHeader("Pragma","no-cache"); response.setDateHeader("Expires",0); if (request.getProtocol().equals("HTTP/1.1")) response.setHeader("Cache-Control", "no-cache"); %>
<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>UDADA - OUR DIET DIARY</title>

    <!-- Custom fonts for this template-->
    <link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    

    <!-- Custom styles for this template-->
    <link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">
    <!-- Bootstrap core JavaScript-->
    <script src="/resources/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- cdn chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@0.7.0"></script>
	
	<style>
@font-face {
     font-family: 'S-CoreDream-4Regular';
     src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-4Regular.woff') format('woff');
     font-weight: normal;
     font-style: normal;
}
	</style>
    
    
</head>

<body id="page-top" style="font-family: 'S-CoreDream-4Regular', sans-serif; ">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav sidebar sidebar-dark accordion bg-gradient-primary" id="accordionSidebar">

            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/">
                <div class="sidebar-brand-icon">
                    <img src="/resources/imgs/logo2.svg" width="30">
                </div>
                <div class="sidebar-brand-text mx-2 mb-0 h4"><strong>UDADA</strong></div>
            </a>

            <hr class="sidebar-divider">

            <div class="sidebar-heading">
                내 정보
            </div>
            <li class="nav-item mt-0">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#myPage"
                    aria-expanded="true" aria-controls="myPage">
                    <i class="fas fa-fw fa-user"></i>
                    <span>마이페이지</span>
                </a>
                <div id="myPage" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                    	<a class="collapse-item" href="/member/myWeight">마이 프로필</a>
                    	<a class="collapse-item" href="/member/foodMy">마이 푸드</a>
                        <a class="collapse-item" href="/exercise/mylist">마이 운동</a>
                    </div>
                </div>
            </li>

            <li class="nav-item mt-0">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#myCalendar"
                    aria-expanded="true" aria-controls="myCalendar">
                    <i class="fas fa-fw fa-calendar"></i>
                    <span>캘린더</span>
                </a>
                <div id="myCalendar" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="/member/calendar">주간 캘린더</a>
                        <a class="collapse-item" href="/member/calendarMonth">월간 캘린더</a>
                    </div>
                </div>
            </li>

            <hr class="sidebar-divider">

            <div class="sidebar-heading">
                커뮤니티
            </div>
            <li class="nav-item mt-0">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#journal"
                    aria-expanded="true" aria-controls="journal">
                    <i class="fas fa-fw fa-file-alt"></i>
                    <span>저널</span>
                </a>
                <div id="journal" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="/journal/list">저널 리스트</a>
                        <a class="collapse-item" href="/journal/mylist">마이 저널</a>
                    </div>
                </div>
            </li>
            
            <li class="nav-item mt-0">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#challenge"
                    aria-expanded="true" aria-controls="challenge">
                    <i class="fas fa-fw fa-users"></i>
                    <span>챌린지</span>
                </a>
                <div id="challenge" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="/challenge/list">챌린지 리스트</a>
                        <a class="collapse-item" href="/challenge/mychallenge">마이 챌린지</a>
                    </div>
                </div>
            </li>
             <li class="nav-item mt-0">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#recipe"
                    aria-expanded="true" aria-controls="recipe">
                    <i class="fas fa-fw fa-utensils"></i>
                     <span>레시피</span>
                </a>
                     <div id="recipe" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="/recipe/list">레시피 리스트</a>
                        <a class="collapse-item" href="/recipe/myRecipe">마이 레시피</a>
                    </div>
                </div>
            </li>

            <hr class="sidebar-divider">

            <div class="sidebar-heading">
                데이터베이스
            </div>
            <li class="nav-item">
                <a class="nav-link" href="/food/list">
                    <i class="fas fa-fw fa-hamburger"></i>
                    <span>푸드</span></a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="/exercise/list">
                    <i class="fas fa-fw fa-running"></i>
                    <span>운동</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button id="sidebarToggle" style="background-color: transparent; outline-color: transparent; border-color: transparent;"></button>
            </div>

        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column" style="background-color: #FAFCFF">

			<!-- Main Content -->
			<div id="content">
				<!-- Topbar -->
				<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow py-0" style="height: auto;">
				    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3" style="color: gray;">
                        <i class="fa fa-bars"></i>
                    </button>
					<!-- Topbar Navbar -->
				<div>
				<div class="h6 my-1" id="nowDate"></div>
				<sec:authorize access="isAuthenticated()">
				<div class="h5 my-0"><strong style="color: black"><sec:authentication property="principal.memberDTO.mName"/></strong>님 환영합니다</div>
				</sec:authorize>
				</div>
					<ul class="navbar-nav ml-auto">		
					</ul>
					
					<div class="topbar-divider d-none d-sm-block" ></div>
							<ul class="navbar-nav">
							<sec:authorize access="isAnonymous()">
							 <li class="nav-item dropdown no-arrow">
		                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
		                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color: #d0342c;">
		                                <span class="mr-2 d-none d-lg-inline">
		                                	게스트
		                                </span>
		                                <i class="fas fa-user-times fa-lg"></i>
		                            </a>
		                            <!-- Dropdown - User Information -->
		                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
		                                aria-labelledby="userDropdown">
		                                <a class="dropdown-item" href="/member/login">
		                                    <i class="fas fa-user-check fa-sm fa-fw mr-2"></i>
		                                    로그인
		                                </a>
		                                <a class="dropdown-item" href="/member/joinForm">
		                                    <i class="fas fa-user-plus fa-sm fa-fw mr-2"></i>
		                                    회원가입
		                                </a>
		                            </div>
		                        </li>
							</sec:authorize>
							<sec:authorize access="isAuthenticated()">

							 <li class="nav-item dropdown no-arrow">
		                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
		                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color: #007cb8;">
		                                <span class="mr-2 d-none d-lg-inline">
		                                	<sec:authentication property="principal.memberDTO.mName" />
		                                </span>
		                                <i class="fas fa-user-circle fa-lg"></i>
		                            </a>
		                            <!-- Dropdown - User Information -->
		                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
		                                aria-labelledby="userDropdown">
		                                <a class="dropdown-item" href="/member/pwdCheck">
		                                    <i class="fas fa-user-edit fa-sm fa-fw mr-2"></i>
		                                    정보수정
		                                </a>
		                                <a class="dropdown-item" href="/member/logout">
		                                    <i class="fas fa-user-times fa-sm fa-fw mr-2"></i>
		                                    로그아웃
		                                </a>
		                            </div>
		                        </li>
		                        </sec:authorize>
							</ul>
						
					
				</nav>

				<!-- End of Topbar -->
				
				
				
	<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal.memberDTO.mGrade" var="loginUserRole"/> 
   	<sec:authentication property="principal.memberDTO.mEmail" var="loginUser"/> 

    </sec:authorize>
	<script src="/resources/js/dateCalculator.js"></script>