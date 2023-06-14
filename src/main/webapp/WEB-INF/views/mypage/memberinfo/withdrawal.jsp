<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../common/header.jsp"%>
<head>
<meta charset="UTF-8">
<title>마이페이지 > 회원정보 > 회원탈퇴</title>
<script defer src="static/js/userinfo-withdrawal.js"></script>
</head>
<body>
	<div id="sidebar">
		<%@ include file="../sidebar.jsp"%>
	</div>
	<!-- 메인 컨텐츠 시작 -->
	<main id="main_content">
		<form id="form">
			<h3 class="title">회원 탈퇴</h3>
			<!-- 인풋 입력 시작 -->
			<div class="edit_wrap">
				<div class="edit_reason">
					<h4 class="label">탈퇴 사유를 선택해주세요.</h4>
					<div class="input_wrap">
						<p class="tip_txt">* SHAPE의 더 나은 서비스를 위한 것이니 한가지만 선택 부탁 드립니다.</p>
						<ul class="reason_list">
							<li>
								<input type="radio"
									   name="reason"
									   id="c1"
									   checked="checked"
									   value="다른 E-MAIL을 사용하기 위해서"/>
							    <label for="c1">다른 E-MAIL을 사용하기 위해서</label>
							</li>
							<li>
								<input type="radio"
									   name="reason"
									   id="c2"
									   value="사용빈도가 낮고, 개인정보 유출이 우려되어서"/>
							    <label for="c2">사용빈도가 낮고, 개인정보 유출이 우려되어서</label>
							</li>
							<li>
								<input type="radio"
									   name="reason"
									   id="c3"
									   value="사이트 이용시 장애가 많아서"/>
							    <label for="c3">사이트 이용시 장애가 많아서</label>
							</li>
							<li>
								<input type="radio"
									   name="reason"
									   id="c4"
									   value="서비스의 질에 대한 불만이 있어서"/>
							    <label for="c4">서비스의 질에 대한 불만이 있어서</label>
							</li>
							<li>
								<input type="radio"
									   name="reason"
									   id="c5"
									   value="사이트 이용시 고객응대가 나빠서"/>
							    <label for="c5">사이트 이용시 고객응대가 나빠서</label>
							</li>
							<li>
								<input type="radio"
									   name="reason"
									   id="c6"
									   value="기타" />
							    <label for="c6">기타</label>
							    <input type="text"
							    	   name="etc"
							    	   class="request_txt" />
							</li>
						</ul>
					</div>
				</div>
				<div class="edit_id">
					<h4 class="label">탈퇴할 아이디</h4>
					<div class="input_wrap">
						<span class="user_id">${ id }</span>
					</div>
				</div>
				<div class="edit_pwd">
					<h4 class="label">
						<label for="pw">비밀번호 입력</label>
					</h4>
					<div class="input_wrap">
						<input type="password"
							   id="inputPwd"
							   name="inputPwd" 
							   required />
						<ul class="check_msg">
							<li>* 본인인증을 위해 비밀번호를 입력해 주세요.</li>
						</ul>
					</div>
				</div>
			</div>
			<!-- 인풋 입력 끝 -->
			<!-- 탈퇴가능: 탈퇴전 참고 사항 시작 -->
			<div class="msg_wrap">
				<div class="msg_content">
					<h4 class="msg_title">회원탈퇴 전 아래 내용을 꼭 확인해 주세요.</h4>
					<ol class="check_list">
						<li>1. 회원탈퇴 시 회원님의 아이디는 즉시 탈퇴처리 되며, 회원정보는 모두 삭제되며 복구되지 않습니다.</li>
						<li>2. 모임 신청정보, 개설한 모임페이지 등 일부 정보는 개인정보취급지침에 따라 일정기간 보관됩니다.</li>
					</ol>
				</div>
				<div class="check_wrap">
					<input type="checkbox"
						   name="test"
						   id="test" 
						   required />
				  	<label for="test">위의 내용을 모두 확인하였습니다.</label>
				</div>
			</div>
			<!-- 참고사항 끝 -->
			<!-- 버튼영역 시작 -->
			<div class="bottom_btn_area">
				<div class="btn_wrap">
					<a href="myprofile" class="btn_again">
					취소하기
					</a>
					<input type="submit"
						   value="회원탈퇴"
						   class="btn_submit" />
				</div>
			</div>
			<!-- 버튼영역 끝 -->
		</form>
	</main>
	<!-- 메인 컨텐츠 끝 -->
</body>
<footer>
	<%@ include file="../../common/footer.jsp"%>
</footer>