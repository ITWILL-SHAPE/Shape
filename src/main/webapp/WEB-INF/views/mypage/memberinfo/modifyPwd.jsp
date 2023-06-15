<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../common/header.jsp"%>
<head>
<script defer src="static/js/userPwd-modify.js"></script>
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
	<div class="row">

		<div class="my-2 pt-5 col-4" id="sidebar">
			<%@ include file="../sidebar.jsp"%>
		</div>
		<!-- 메인 콘텐츠 시작 -->
		<div id="main_content" class="container col-8">
			<div class="my-2 pt-5 titleBolder">

				<form class="modifyPwd_form">
					<h3 class="title my-2 pt-3 titleBolder">비밀번호 수정</h3>
					<!-- 참고사항 시작 -->
					<ul class="tip_list">
						<li class="my-2 pt-1">개인정보보호를 위해 최소 3개월 이내에는 정기적으로 비밀번호를 변경해
							주시는 게 좋습니다.</li>
						<li class="my-2 pt-1">비밀번호는 쉬운번호나 타 사이트와 같을 경우 도용되기 쉽습니다.</li>
						<li class="my-2 pt-1">주민번호,전화번호,생일 등 개인정보와 연관된 문자나 숫자는 보안상
							위험이 높으므로 사용을 자제해 주세요.</li>
					</ul>
					<!-- 참고사항 끝 -->
					<!-- 인풋입력 시작 -->
					<div class="input_area my-2 pt-5 ">
						<div class="pwd_now">
							<h6 class="label">
								<label for="nowPwd">현재 비밀번호 입력</label>
							</h6>
							<div class="inputPwd">
								<input type="password" id="nowPwd" name="nowPwd" required autofocus/>
							</div>
						</div>
						<div class="pwd_new my-2 pt-3">
							<h6 class="label">
								<label for="newPwd">새로운 비밀번호 입력</label>
							</h6>
							<div class="inputPwd">
								<input type="password" id="newPwd" name="newPwd" required />
								<p class="tip_txt">* 영문, 특수문자와 숫자를 포함하여 최소 8자 이상 입력해 주세요.</p>
							</div>
						</div>
						<div class="pwd_re">
							<h6 class="label">
								<label for="rePwd">새로운 비밀번호 입력 확인</label>
							</h6>
							<div class="inputPwd">
								<input type="password" id="rePwd" name="rePwd" required />
								<p class="tip_txt">* 새로운 비밀번호 변경확인을 위하여 다시 한번 입력해 주세요.</p>
							</div>
						</div>
					</div>
					<!-- 인풋입력 끝 -->
					<!-- 버튼영역 시작 -->
					<div class="btn_area">
						<div
							class="btn_wrap my-2 pt-3 d-grid gap-2 d-md-flex justify-content-md-end">
							<input type="submit" class="btn btn_submit btn-classic"
								value="변경완료" /> <input type="submit"
								class="btn btn_cancel btn-secondary" value="취소" />
						</div>


					</div>
					<!-- 버튼영역 끝 -->
				</form>
			</div>
		</div>

		<!-- 메인 컨텐츠 끝 -->
	</div>
</body>

<footer>
	<%@ include file="../../common/footer.jsp"%>
</footer>