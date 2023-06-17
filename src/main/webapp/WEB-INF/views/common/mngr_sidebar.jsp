<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!-- 뉴 디자인 -->
<div class="d-flex flex-column flex-shrink-0 p-3 text-bg-dark">
	<div class="flex-column text-center">
		<a href="<%=request.getContextPath()%>/mngr"
			class="text-decoration-none">
			<img src="<%=request.getContextPath()%>/static/images/common/Asset2.png"
				class="img-fluid">
		</a>
	</div>
	<hr>
	<ul class="nav nav-pills flex-column mb-auto" id="sideBar">
		<li>
			<c:url value="/mngr" var="home"/>
			<a href="${ home }" class="nav-link text-white">
				<i class="bi bi-speedometer2"></i>
				대쉬보드
			</a>
		</li>
		<li>
			<c:url value="/mngr/user/list" var="users"/>
			<a href="${ users }" class="nav-link text-white">
				<i class="bi bi-people"></i>
				사용자 관리			
			</a>
		</li>
		<li>
			<a class="nav-link dropdown-toggle text-white" id="dropInfo"
				 role="button" data-bs-toggle="dropdown" aria-expanded="false">
				<i class="bi bi-info-circle"></i>
				도움말
			</a>
			<ul class="dropdown-menu dropdown-menu-dark p-3 text-center"
				aria-labelledby="dropInfo">
				<li class="mb-2 dropdown-item">
				    <c:url value="/mngr/notice/list" var="mngrNoticeListPage"></c:url>
					<a href="${ mngrNoticeListPage }"
						class="text-white text-decoration-none">
						공지사항
					</a>
				</li>
				<li class="mb-2 dropdown-item">
					<c:url value="/mngr/faq/list" var="mngrFaqListPage"></c:url>
					<a href="${ mngrFaqListPage }"
						class="text-white text-decoration-none">
						FAQ
					</a>
				</li>
				<li class="">
					<c:url value="/mngr/qna/list" var="mngrQnAListPage"></c:url>
					<a href="${ mngrQnAListPage }"
						class="text-white text-decoration-none">
						Q&amp;A
					</a>
				</li>
			</ul>
		</li>
	</ul>
	<hr>
	<!-- sidebar 개발 후 지울 것: sec -->
	<sec:authorize access="isAuthenticated()">
	<div class="dropdown">
		<a href="#"
			class="d-flex align-items-center text-white text-decoration-none dropdown-toggle"
			data-bs-toggle="dropdown" aria-expanded="false">
				<!-- 해당 프로필 -->
				<img src="https://github.com/mdo.png" alt="" width="32" height="32"
				class="rounded-circle me-2">
				<!-- 관리자 이름 -->
				<strong>
					<sec:authentication property="principal.user.name"/>
				</strong>
		</a>
		<ul class="dropdown-menu dropdown-menu-dark text-small shadow">
			<li>
				<c:url value="/member/logout" var="logout"/>
				<a class="dropdown-item" href="${ logout }">로그아웃</a>
			</li>
		</ul>
	</div>
	</sec:authorize>
</div>
<!-- // 뉴 디자인 -->
<!-- 구디자인
<div class="accordion" id="accordionExample">
	<ul class="sidebar">
		<li>
			<div class="logo">
				<a class="home" href="">홈</a>
			</div>
		</li>
		<li>
			<div class="accordion-item">
				<h2 class="accordion-header" id="userMng">
					<a href="" class="none-accordion-button">사용자 관리</a>
				</h2>
			</div>
		</li>
		<li>
			<div class="accordion-item">
				<h2 class="accordion-header" id="helper">
					<button class="accordion-button collapsed" type="button"
						data-bs-toggle="collapse" data-bs-target="#helperCollapse"
						aria-expanded="true" aria-controls="collapseOne">
						도움말
					</button>
				</h2>
				<div id="helperCollapse" class="accordion-collapse collapse"
					aria-labelledby="helper" data-bs-parent="#accordionExample">
					<div class="accordion-body">
						<ul>
							<li>
							    <c:url value="/mngr/notice/list" var="mngrNoticeListPage"></c:url>
								<a href="${ mngrNoticeListPage }">공지사항</a>
							</li>
							<li>
								<c:url value="/mngr/faq/list" var="mngrFaqListPage"></c:url>
								<a href="${ mngrFaqListPage }">FAQ</a>
							</li>
							<li>
								<c:url value="/mngr/qna/list" var="mngrQnAListPage"></c:url>
								<a href="${ mngrQnAListPage }">Q&amp;A</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</li>
		<li>
			<div>
				<a href="" class=""><i class="bi bi-person after-login"></i></a>
				<a href="">로그아웃</a>
			</div>
		</li>
	</ul>
</div>
// 구디자인 -->
