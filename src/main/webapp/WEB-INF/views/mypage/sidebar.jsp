<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

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

#sidebar {
	padding: 1rem;
	background-color: white;
	z-index: 9999;
	float: left;
	width: 15rem;
}
</style>
<div id="sidebar">
	<div class="border bg-body rounded shadow-sm p-3 mx-2 pb-4">
		<ul>
			<li>
				<nav style="margin-top: 30px;">
					<h5 class="mainColor">회원정보</h5>
					<ul class="hyphen-list">
						<li><a class="text-decoration-none text-dark" href="myprofile?id=${ id }">나의 프로필</a></li>
						<li><a class="text-decoration-none text-dark" href="confirmpwdpage?id=${ id }">비밀번호 수정</a></li>
						<li><a class="text-decoration-none text-dark" href="withdrawalpage?id=${ id }">회원탈퇴(beta)</a></li>
					</ul>
				</nav>
			</li>
			<li>
				<nav style="margin-top: 30px;">
					<h5 class="mainColor">모임</h5>
					<ul class="hyphen-list">
						<li><a class="text-decoration-none text-dark" href="active?id=${ id }">내가 참여 중인 모임</a></li>
						<li><a class="text-decoration-none text-dark" href="created?id=${ id }">내가 개설한 모임</a></li>
						<li><a class="text-decoration-none text-dark" href="interests?id=${ id }">내가 찜한 모임</a></li>
						<li><a class="text-decoration-none text-dark" href="viewed?id=${ id }">최근 본 모임(beta)</a></li>
					</ul>
				</nav>
			</li>
			<li>
				<nav style="margin-top: 30px">
					<h5 class="mainColor">게시판</h5>
					<ul class="hyphen-list">
						<li><a class="text-decoration-none text-dark" href="myposts?id=${ id }">내가 작성한 게시글</a></li>
						<li><a class="text-decoration-none text-dark" href="mycomments?id=${ id }">내가 작성한 댓글</a></li>
					</ul>
				</nav>
			</li>
		</ul>
	</div>
</div>