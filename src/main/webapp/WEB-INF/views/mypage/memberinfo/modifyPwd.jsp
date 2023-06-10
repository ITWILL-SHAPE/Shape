<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../common/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script defer src="static/js/userPwd-confirm.js"></script>
<title>마이페이지 > 회원정보 > 비밀번호 수정</title>
<style>
	.tip_list {
		list-style: none;
	}
	.tip_list li:before {
		content: "- ";
	}
</style>
</head>
<body>
	<div id="sidebar">
		<%@ include file="../sidebar.jsp"%>
	</div>
	<!-- 메인콘텐츠 시작 -->
	<main class="main_content">
		<form class="modifyPwd_form">
			<h3 class="title">비밀번호 변경</h3>
			<!-- 참고사항 시작 -->
			<ul class="tip_list">
				<li>개인정보보호를 위해 최소 3개월 이내에는 정기적으로 비밀번호를 변경해 주시는 게 좋습니다.</li>
				<li>비밀번호는 쉬운번호나 타 사이트와 같을 경우 도용되기 쉽습니다.</li>
				<li>주민번호,전화번호,생일 등 개인정보와 연관된 문자나 숫자는 보안상 위험이 높으므로 사용을 자제해 주세요.</li>
			</ul>
			<!-- 참고사항 끝 -->
			<!-- 인풋입력 시작 -->
			<div class="input_area">
				<div class="pwd_now">
					<h4 class="label">
						<label for="nowPwd">현재 비밀번호 입력</label>
					</h4>
					<div class="inputPwd">
						<input type="password"
						       id="nowPwd"
						       name="nowPwd"
						       required />
					</div>
				</div>
				<div class="pwd_new">
					<h4 class="label">
						<label for="newPwd">새로운 비밀번호 입력</label>
					</h4>
					<div class="inputPwd">
						<input type="password"
						       id="newPwd"
						       name="newPwd"
						       required />
						<p class="tip_txt">* 영문, 특수문자와 숫자를 포함하여 최소 8자 이상 입력해 주세요.</p>
					</div>
				</div>
				<div class="pwd_re">
					<h4 class="label">
						<label for="rePwd">새로운 비밀번호 입력 확인</label>
					</h4>
					<div class="inputPwd">
						<input type="password"
						       id="rePwd"
						       name="rePwd"
						       required />
						<p class="tip_txt">* 새로운 비밀번호 변경확인을 위하여 다시 한번 입력해 주세요.</p>
					</div>
				</div>
			</div>
			<!-- 인풋입력 끝 -->
			<!-- 버튼영역 시작 -->
			<div class="btn_area">
				<div class="btn_wrap">
					<input type="submit" class="btn_submit" value="변경완료" /> <input
						type="submit" class="btn_cancel" value="취소" />
				</div>
			</div>
			<!-- 버튼영역 끝 -->
		</form>
	</main>
	<!-- 메인콘텐츠 끝 -->
</body>
</html>
<%@ include file="../../common/footer.jsp"%>