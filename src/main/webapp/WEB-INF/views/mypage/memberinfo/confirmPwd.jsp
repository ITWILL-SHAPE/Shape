<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ include file="../../common/header.jsp"%>
<head>
<script defer src="static/js/inputPwd-confirm.js"></script>
<script>
	var id = '${id}';
	console.log(id);
</script>
</head>
<body>
	<!-- 제목 -->
	<div class="row">
		<div class="col-2"></div>
		<div class="col-10">
			<div class="my-2 p-3 text-center">
				<h1 class="titleBolder">비밀번호 재입력</h1>
			</div>
		</div>
	</div>
	<!-- 사이드 바 , 내용 -->
	<div class="row">
		<div class="col-2">
			<%@ include file="../sidebar.jsp"%>
		</div>

		<div id="main_content"
			class="container col-8 border bg-body rounded shadow-sm">
			<form class="confirmPwd_form">
				<div class="sub_content my-2 pt-3 text-center">
					<h6 class="sub_title my-2 pt-3">
						본인확인을 위해 <strong class="mainColor">로그인 비밀번호</strong>를 한 번 더
						입력해주세요.
					</h6>
					<br>
					<div class="input-groupPwd">
						<input type="password" id="inputPwd" autofocus name="inputPwd"
							placeholder=" 비밀번호를 입력해 주세요" class="form-control" /> <input
							type="submit" class="btn btn_login btn-classic" value="확인" />
					</div>

				</div>
				<div class="banner_area my-2 pt-5 text-center ">
					<a
						href="https://www.itwilledu.net/cmn/eduCrseMain/1000000/all/CRSE_00000000000620eduCrseMainDetail.do"
						target="_blank" title="새 창 이동"> <img
						src="https://www.itwilledu.net/cmn/cmm/fms/getImage.do?atchFileId=FILE_000000000003810"
						alt="배너 타이틀" style="width: 400px; height: 250px;">
					</a>
				</div>
			</form>
		</div>
	</div>
	<!-- 메인 컨텐츠 끝 -->
</body>
<footer>
	<%@ include file="../../common/footer.jsp"%>
</footer>