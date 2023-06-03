<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@ include file="./header.jsp" %>
	<body>
		<div id="body">
			<div>
				
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
			</div>
			<ul>
				<li><img alt="" src="./static/images/common/Asset1.png"></li>
				<li><img alt="" src="./static/images/common/Asset1.png"></li>
				<li><img alt="" src="./static/images/common/Asset1.png"></li>
				<li><img alt="" src="./static/images/common/Asset1.png"></li>
				<li><img alt="" src="./static/images/common/Asset1.png"></li>
				<li><img alt="" src="./static/images/common/Asset1.png"></li>
				<li><img alt="" src="./static/images/common/Asset1.png"></li>
				<li><img alt="" src="./static/images/common/Asset1.png"></li>
				<li><img alt="" src="./static/images/common/Asset1.png"></li>
				<li><img alt="" src="./static/images/common/Asset1.png"></li>
				<li><img alt="" src="./static/images/common/Asset1.png"></li>
				<li><img alt="" src="./static/images/common/Asset1.png"></li>
				<li><img alt="" src="./static/images/common/Asset1.png"></li>
				<li><img alt="" src="./static/images/common/Asset1.png"></li>
			</ul>
			
			<img alt="" src="./static/images/common/Asset1.png">
			<img alt="" src="./static/images/common/Asset1.png">
			<img alt="" src="./static/images/common/Asset1.png">
			<img alt="" src="./static/images/common/Asset1.png">
			<img alt="" src="./static/images/common/Asset1.png"> -->
			commit 테스트
			branch 테스트
			
			테스트
			
			branch 테스트 1
			
			xptmxm
		</div>	
	</body>
	
<%@ include file="./footer.jsp" %>