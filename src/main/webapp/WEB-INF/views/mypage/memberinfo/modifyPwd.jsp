<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../common/header.jsp"%>
<head>
<script defer src="static/js/userPwd-modify.js"></script>
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
				<h1 class="titleBolder">비밀번호 수정</h1>
			</div>
		</div>
	</div>
	<!-- 사이드 바 , 내용 -->
	<div class="row">
		<div class="col-2">
			<%@ include file="../sidebar.jsp"%>
		</div>

		<!-- 메인 콘텐츠 시작 -->
		<div id="main_content"
			class="container myPage-container col-8 border bg-body rounded shadow-sm">
			<div class="my-2 pt-5">
				<form class="modifyPwd_form">
					<!-- 참고사항 시작 -->
					<ul class="tip_list">
						<li class=" pt-2 px-3">개인정보보호를 위해 최소 3개월 이내에는 정기적으로 비밀번호를 변경해
							주시는 게 좋습니다.</li>
						<li class=" pt-1 px-3">비밀번호는 쉬운번호나 타 사이트와 같을 경우 도용되기 쉽습니다.</li>
						<li class="pb-2 px-3">주민번호,전화번호,생일 등 개인정보와 연관된 문자나 숫자는 보안상
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
								<input class="form-control form-control-sm custom-input"
									type="password" id="nowPwd" name="nowPwd" required autofocus />
							</div>
						</div>
						<div class="pwd_new my-2 pt-3">
							<h6 class="label">
								<label for="newPwd">새로운 비밀번호 입력</label>
							</h6>
							<div class="inputPwd">
								<input class="form-control form-control-sm custom-input"
									type="password" id="newPwd" name="newPwd" required />
								<p class="tip-text">* 영문, 특수문자와 숫자를 포함하여 최소 8자 이상 입력해 주세요.</p>
							</div>
						</div>
						<div class="pwd_re">
							<h6 class="label">
								<label for="rePwd">새로운 비밀번호 입력 확인</label>
							</h6>
							<div class="inputPwd">
								<input class="form-control form-control-sm custom-input"
									type="password" id="rePwd" name="rePwd" required />
								<p class="tip-text">* 새로운 비밀번호 변경확인을 위하여 다시 한번 입력해 주세요.</p>
							</div>
						</div>
					</div>
					<!-- 인풋입력 끝 -->
					<!-- 버튼영역 시작 -->
					<div class="btn_area">
						<div
							class="my-2 pt-3 d-grid gap-2 d-md-flex justify-content-md-center pb-4">
							<input id="updateBtn" type="button"
								class="btn btn_submit btn-classic" value="수정" /> <input
								type="button" class="btn btn_cancel btn-secondary" value="취소" />
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