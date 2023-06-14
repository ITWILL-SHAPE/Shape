<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ include file="../../common/header.jsp"%>
<head>
<meta charset="UTF-8">
<script defer src="static/js/inputPwd-confirm.js"></script>
<title>마이페이지 > 회원정보 > 비밀번호 수정</title>
</head>
<body>
	<div class="my-2 pt-5" id="sidebar">
		<%@ include file="../sidebar.jsp"%>
	</div>
	<!-- 메인 콘텐츠 시작 -->
	<main id="main_content" class="container">
			<form class="confirmPwd_form">
				<div class="sub_content my-2 pt-5 text-center">
					<h3 class="title my-2 pt-3">비밀번호 재입력</h3>
					<h6 class="sub_title my-2 pt-3">
					본인확인을 위해 <strong>로그인 비밀번호</strong>를 한 번 더 입력해주세요.
					</h6>
					<br>
					<br>
					<input 
					       type="password"
					       id="inputPwd"
					       name="inputPwd"
					       placeholder="  비밀번호를 입력해 주세요" />
					<input type="submit"
					       class="btn_login btn-classic"
					       value="확인" />
				</div>
				<div class="banner_area my-2 pt-5 text-center ">
					<a href="https://www.itwilledu.net/cmn/eduCrseMain/1000000/all/CRSE_00000000000620eduCrseMainDetail.do"
					   target="_blank"
					   title="새 창 이동">
						<img src="https://www.itwilledu.net/cmn/cmm/fms/getImage.do?atchFileId=FILE_000000000003810"
						     alt="배너 타이틀"
						     style="width: 400px; height: 250px;">
					</a>
				</div>
			</form>
	</main>
	<!-- 메인 컨텐츠 끝 -->
</body>
<footer>
	<%@ include file="../../common/footer.jsp"%>
</footer>