<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../common/header.jsp" %>

	<div class="container">
		<div class="my-2 p-3 text-center">
			<h1>로그인</h1>
		</div>
		<div class="text-center border bg-body rounded shadow-sm loginBox">
			<form method="post" action="/shape/login" class="text-center">
				<div class="my-2">
					<main class="d-grid gap-3 login-inputBox">
						<div class="form-floating">
							<input id="floatingInput" class="form-control"
								type="text" name="username" placeholder="ID"/>
							<label for="floatingInput">ID</label>
						</div>						
						<div class="form-floating">
							<input id="floatingPassword" class="form-control"
								type="password" name="password" placeholder="Password"/>
							<label for="floatingPassword">Password</label>
						</div>
						<c:if test="${ error != null }">
							<div class="errorMessage">
								아이디 및 비밀번호가 잘못됐습니다.
							</div>
						</c:if>
					</main>					
				</div>
				<button class="w-50 btn btn-lg btn-primary" type="submit">로그인</button>
			</form>
			<div class="text-end w-50 m-auto">
				<c:url value="/member/signUp" var="signUp"/>
				<a href="${ signUp }" class="text-decoration-none text-dark">회원가입</a> | 
				<c:url value="/member/findIdOrPwd" var="findIdOrPwd"/>
				<a href="${ findIdOrPwd }" class="text-decoration-none text-dark">아이디 및 비밀번호 찾기</a>
			</div>
			<!-- 통합 로그인 -->
			<!-- 
			<div class="text-center w-50 m-auto my-3 link">
				<ul class="content_list">
					<li class="bg-warning rounded-circle">
						<a href="javascript:kakaoLogin()" class="custom">
							<i class="bi bi-chat-fill font-20"></i>
						</a>
					</li>
				</ul>
			</div>
			 -->
		</div>
	</div>
<%@ include file="../common/footer.jsp" %>