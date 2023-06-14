<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<!-- 반응형 웹 페이지 -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<!-- css -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/css/common.css"/>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/css/style.css"/>
		<link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/jquery-ui.css">
		<!-- js -->		
		<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
		<script src="<%=request.getContextPath()%>/static/js/jquery-ui.min.js"></script>
		<script src="<%=request.getContextPath()%>/static/js/datepicker.js"></script>
		<!-- icon -->
		<link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/static/images/common/favicon.ico">
		<title>Shape</title>
	</head>
	<body>
		<!-- 뉴 디자인 -->
		<nav class="py-2 bg-light border-bottom navbar-fixed-top">
			<div class="container d-flex flex-wrap">
				<ul class="nav me-auto">
				</ul>
				<ul class="nav">
					<sec:authorize access="isAnonymous()">
						<li class="nav-item">
							<c:url value="/member/customLogin" var="login"/>
							<a href="${ login }" class="nav-link link-dark px-2">로그인</a>
						</li>
						<li class="nav-item">
							<c:url value="/member/signUp" var="signUp"/>
							<a href="${ signUp }" class="nav-link link-dark px-2">회원가입</a>
						</li>
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
						<span><sec:authentication property="principal.user.name" var="name"/> ${ name }님</span>
						<sec:authentication property="principal.user.id" var="id" />
					</sec:authorize>
				</ul>
			</div>
		</nav>
		<header class="py-3 mb-4 border-bottom">
			<div class="container">
				<div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
					<!-- logo -->
					<a href="<%=request.getContextPath()%>"
						class="d-flex align-items-center mb-2 mb-lg-0 text-decoration-none col-md-3">
						<img src="<%=request.getContextPath()%>/static/images/common/Asset1.png">
					</a>
					<!-- 메뉴 -->
					<nav class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0 dropdown">
						<button onclick="location.href='/shape/test/testHandler'" class="btn headerBtn me-5">
							test
						</button>
						<button onclick="location.href='/shape/meet/create'" class="btn headerBtn me-5">
							모임 만들기
						</button>
						<button onclick="location.href='/shape/meet/list'" class="btn headerBtn me-5">
							모임 찾기
						</button>
						<button onclick="location.href='/shape/post/list'" class="btn headerBtn me-5">
							게시판
						</button>
						<div class="btn-group">
							<button class="btn dropdown-toggle headerBtn" type="button" id="dropInfo"
								data-bs-toggle="dropdown" aria-expanded="false">
								도움말
							</button>
							<ul class="dropdown-menu" aria-labelledby="dropInfo">
								<li>
									<c:url value="/info/notice/list" var="notice"/>
									<a class="dropdown-item" href="${ notice }">공지사항</a>
								</li>
								<li>
									<c:url value="/info/faq" var="faq"/>
									<a class="dropdown-item" href="${ faq }">FAQ</a>
								</li>
								<li>
									<c:url value="/info/qna" var="qna"/>
									<a class="dropdown-item" href="${ qna }">Q&amp;A</a>
								</li>
							</ul>
						</div>
					</nav>
					<!-- 마이페이지 -->
					<sec:authorize access="isAuthenticated()">
						<div class="dropdown text-end">
							<c:url value="/myprofile" var="myPage"/>
							<a href="${ myPage }"
								class="d-block link-dark text-decoration-none dropdown-toggle"
								id="dropUser" data-bs-toggle="dropdown" aria-expanded="false">
								<!-- 이미지 파일 대체 -->
								<img src="https://github.com/mdo.png" alt="mdo" width="32"
								height="32" class="rounded-circle">
							</a>
							<ul class="dropdown-menu text-small"
								aria-labelledby="dropUser">
								<li>
									<c:url value="/myprofile?id=${ id }" var="myPage"/>
									<a class="dropdown-item" href="${ myPage }">마이페이지</a>
								</li>
								<li><hr class="dropdown-divider"></li>
								<li>
									<c:url value="/member/logout" var="logout"/>
									<a class="dropdown-item" href="${ logout }">로그아웃</a>
								</li>
							</ul>
						</div>
					</sec:authorize>
				</div>
			</div>
		</header>
		<!-- // 뉴 디자인 -->
		
		<!-- 구 디자인 -->
		<%--
		<div id="wrap">
			<header class="header">
				<div class="inner-wrap">
					<h1 class="logo"><a href="<%=request.getContextPath()%>" title="홈페이지">메인페이지</a></h1>
				</div>
				<div class="header-wrap">
					<div class="util">
						<!-- 로그인 전 -->
						<div class="before">
							<!-- access="isAnonymous()": 익명의 사용자의 경우 true -> 로그인을 안하면 보임. -->
							<sec:authorize access="isAnonymous()">
								<!-- 로그인 -->
								<c:url value="/member/customLogin" var="login"/>
								<a href="${ login }" title="login">로그인</a>
								<!-- 회원가입 -->
								<c:url value="/member/signUp" var="signUp"/>
								<a href="${ signUp }" title="signUp">회원가입</a>
							</sec:authorize>
							<!-- access="isAuthenticated()": 인증된 사용자면 true -> 로그인 했으면 보임. -->
							<sec:authorize access="isAuthenticated()">
								<span><sec:authentication property="principal.user.name"/> 님</span>
								<c:url value="/member/logout" var="logout"/>
								<a href="${ logout }" title="logout">로그아웃</a>
							</sec:authorize>
						</div>
					</div>
				</div>
				<nav>
					<ul class="gnb">
						<li>
							<a href="">기업개요</a>
						</li>
						<li>
							<a href="">모임</a>
							<ul class="sub_menu">
								<li>
									<c:url value="/meet/create" var="meetCreatePage"></c:url>
									<a href="${ meetCreatePage }">모임 만들기</a>
								</li>
								<li>
									<c:url value="/meet/list" var="meetListPage"></c:url>
									<a href="${ meetListPage }">모임 찾기</a>
								</li>
							</ul>
						</li>
						<li>
							<c:url value="/post/list" var="postListPage"></c:url>
							<a href="${ postListPage }">게시판</a>
						</li>
						<li>
							<a href="">도움말</a>
							<ul class="sub_menu">
								<li><a href="/shape/info/notice">공지사항</a></li>
								<c:url value="/info/faq" var="faq"></c:url>
								<li><a href="${ faq }">FAQ</a></li>
								<c:url value="/info/qna" var="qna"></c:url>
								<li><a href="${ qna }">Q&amp;A</a></li>
							</ul>
						</li>
						<!-- 로그인 후 -->
						<li class="profile">
							<a href=""><i class="bi bi-person after-login"></i></a>
							<ul class="sub_menu">
								<li>
									<c:url value="/myprofile" var="myPage"></c:url>
									<a href="${ myPage }">마이페이지</a>
								</li>
							</ul>
						</li>
					</ul>
				</nav>
			</header>
			--%>