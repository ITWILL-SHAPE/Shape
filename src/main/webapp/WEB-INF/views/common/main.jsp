<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@ include file="./header.jsp" %>
	<body>
		<!-- access="isAuthenticated()": 인증된 사용자면 true -> 로그인 했으면 보임. -->
		<sec:authorize access="isAuthenticated()">
			<!-- CustomUser 객체 -->
			<p>principal: <sec:authentication property="principal"/></p>
			<!-- UserInfo 객체 -->
			<p>UserInfo : <sec:authentication property="principal.user"/></p>
			<p>사용자 이름: <sec:authentication property="principal.user.name"/></p>
			<p>사용자 아이디: <sec:authentication property="principal.username"/></p>
			<p>사용자 권한 리스트: <sec:authentication property="principal.user.division"/></p>
		</sec:authorize>
		
		<p>
			header랑 footer를 적용하고 싶으시면<br>
			main.jsp와 같이 만들어주세요.<br>
			include header, footer를 하고 안에 body를 써주세요.<br>
			content는 body안에서 써주시면 됩니다.<br>
			또 js와 css를 추가하고 싶으시면 header에 있는 head 부분에 써주시면 됩니다.<br>
			admin은 사이드 바이기 때문에 또 다릅니다.<br>
			admin css를 고칠 때까지 기다려주세요.<br>
			admin은 현재 있는 툴처럼 만드시면 됩니다.<br>
		</p>
		
	</body>	
<%@ include file="./footer.jsp" %>