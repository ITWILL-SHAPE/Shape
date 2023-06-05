<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../common/header.jsp" %>

	<div class="container">
		<span>로그인</span>
		<div class="text-center border bg-body rounded shadow-sm loginBox">
			<form method="post" action="/shape/login" class="text-center">
				<h1 class="my-4">로그인</h1>
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
				<a href="" class="text-decoration-none text-dark">아이디 및 비밀번호 찾기</a>
			</div>
		</div>
	</div>
		
			<%-- 
			<h2>
				<c:if test="${ error != null }">
					<c:out value="${ error }"/>
				</c:if>
			</h2>
			<h2>
				<c:if test="${ logout != null }">
					<c:out value="${ logout }"/>
				</c:if>
			</h2>
			
			<c:url var="login" value="/member/login"/>
			<form method="post" action="${ login }">
			
			<form method="post" action="/shape/login">
				<div>
					<input type="text" name="username"/>
				</div>
				<div>
					<input type="password" name="password"/>
				</div>
				<div>
					<input type="submit"/>	
				</div>
				<input type="hidden" name="${ _csrf.parameterName }" value="${ _csrf.token }"/>
			</form>
			 --%>

<%@ include file="../common/footer.jsp" %>