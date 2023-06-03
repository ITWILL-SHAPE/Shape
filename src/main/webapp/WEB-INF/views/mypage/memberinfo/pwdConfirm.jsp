<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- 
<%@ include file="../../common/header.jsp" %>
--%>
<!DOCTYPE html>
<html>
<style>
/*
bullet 제거
*/
.hyphen-list {
	list-style: none;
}

/*
li::before 선택자를 사용하여 각 리스트 아이템(<li>)의 시작 부분에 가상 요소를 추가하여 스타일을 적용
*/
.hyphen-list li::before {
	content: "- ";
}

.inputPwd {
	padding: 20px;
}
</style>
<head>
<meta charset="UTF-8">
<title>마이페이지 > 회원정보 > 비밀번호 수정</title>
</head>
<body>
	<%--
		<div id="sidebar">
			<%@ include file="../sidebar.jsp" %>
		</div>
	 --%>
	<form id="pwdConfirm" action="" method="post">
		<h3>비밀번호 변경</h3>
		<ul class="hyphen-list">
			<li>개인정보보호를 위해 최소 3개월 이내에는 정기적으로 비밀번호를 변경해 주시는 게 좋습니다.</li>
			<li>비밀번호는 쉬운번호나 타 사이트와 같을 경우 도용되기 쉽습니다.</li>
			<li>주민번호, 전화번호, 생일 등 개인정보와 연관된 문자나 숫자는 보안상 위험이 높으므로 사용을 자제해 주세요
			</li>
		</ul>
		<!-- 인풋 입력 시작 -->
		<div class="edit_wrap">
			<div class="edit_now">
				<h4 class="label">
					<label for="nowPwd">현재 비밀번호 입력</label>
				</h4>
				<div class="input_wrap">
					<input type="password" id="nowPwd" name="nowPwd" maxlength="48"
						required data-parsley-nowpwd
						data-parsley-class-handler=".main_content"
						data-parsley-required-message="* 현재 비밀번호를 입력해 주세요.">
				</div>
			</div>
			<div class="edit_new">
				<h4 class="label">
					<label for="newPwd">새로운 비밀번호 입력</label>
				</h4>
				<div class="input_wrap">
					<input type="password" id="newPwd" name="newPwd" maxlength="48"
						required data-parsley-minlength="8"
						data-parsley-pattern="/^(?=.*[A-Za-z])(?=.*\d)(?=.*[`\-=\\\[\];',\./~!@#\$%\^&amp;\*\(\)_\+|\{\}:&quot;<>\?])[A-Za-z\d`\-=\\\[\];',\./~!@#\$%\^&amp;\*\(\)_\+|\{\}:&quot;<>\?]/"
						data-parsley-newpwd
						data-parsley-pattern-message="영문, 특수문자와 숫자를 포함하여 주세요."
						data-parsley-class-handler=".main_content"
						data-parsley-minlength-message="* 비밀번호를 8자 이상 입력해주세요."
						data-parsley-required-message="* 새로운 비밀번호를 입력해 주세요."
						aria-autocomplete="list">
					<p class="tip_txt">* 영문, 특수문자와 숫자를 포함하여 최소 8자 이상 입력해 주세요.</p>
				</div>
			</div>
			<div class="edit_re">
				<h4 class="label">
					<label for="rePwd">새로운 비밀번호 입력 확인</label>
				</h4>
				<div class="input_wrap">
					<input type="password" id="rePwd" name="rePwd" maxlength="48"
						data-parsley-minlength="8" data-parsley-equalto="#newPwd" required
						data-parsley-repwd data-parsley-class-handler=".main_content"
						data-parsley-minlength-message="* 비밀번호를 8자 이상 입력해주세요."
						data-parsley-required-message="* 새로운 비밀번호 변경확인을 위하여 다시 한번 입력해 주세요."
						data-parsley-equalto-message="* 새로운 비밀번호 변경확인을 위하여 다시 한번 입력해 주세요.">
					<p class="tip_txt">* 새로운 비밀번호 변경확인을 위하여 다시 한 번 입력해 주세요.</p>
				</div>
			</div>
		</div>
		<!-- 인풋 입력 끝 -->
		<!-- 버튼 영역 시작 -->
		<div class="bottom_btn_area">
			<div class="btn_wrap">
				<input type="submit" value="변경완료" class="btn_submit"> <a
					href="myprofile" class="btn_cancel">취소</a>
			</div>
		</div>
	</form>
</body>
</html>
<%--
<%@ include file="../../common/footer.jsp" %>
 --%>