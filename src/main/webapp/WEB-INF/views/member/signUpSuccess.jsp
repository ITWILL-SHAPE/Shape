<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../common/header.jsp" %>
	<div class="container">
		<div class="border bg-body rounded shadow-sm loginBox position-relative">
			<div class="position-absolute top-50 start-50 translate-middle text-center">
				<h1>회원가입이 완료됐습니다.</h1>
				<h5>Shape에서 취미가 맞는 사람들과<br>새로운 만남을 시작하세요!</h5>
			</div>
			<div class="position-absolute bottom-0 start-50 translate-middle-x my-3">
				<c:url var="login" value="/member/customLogin"/>
				<a href="${ login }" class="btn btn-classic">로그인</a>
			</div>
		</div>
	</div>
<%@ include file="../common/footer.jsp" %>