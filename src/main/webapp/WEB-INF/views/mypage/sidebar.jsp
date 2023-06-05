<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
</style>

<div id="sidebar">
	<ul>
		<li>
			<nav style="margin-top: 30px;">
				<h5>회원정보</h5>
				<ul class="hyphen-list">
					<li><a href="user/myprofile">나의 프로필</a></li>
					<li><a href="user/modifypwd">비밀번호 수정</a></li>
					<li><a href="user/withdrawal">회원탈퇴(beta)</a></li>
				</ul>
			</nav>
		</li>
		<li>
			<nav style="margin-top: 30px;">
				<h5>모임</h5>
				<ul class="hyphen-list">
					<li><a href="user/active">내가 참여 중인 모임</a></li>
					<li><a href="user/created">내가 개설한 모임</a></li>
					<li><a href="user/interests">내가 찜한 모임</a></li>
					<li><a href="user/viewed">최근 본 모임(beta)</a></li>
				</ul>
			</nav>
		</li>
		<li>
			<nav style="margin-top: 30px;">
				<h5>게시판</h5>
				<ul class="hyphen-list">
					<li><a href="user/myposts">내가 작성한 게시글</a></li>
					<li><a href="user/mycomments">내가 작성한 댓글</a></li>
				</ul>
			</nav>
		</li>
	</ul>
</div>
<style>
/* 사이드바 스타일 */
/* id가 sidebar인 요소 선택(#)*/
#sidebar {
	position: fixed;
	top: 0;
	left: 100px;
	width: 200px;
	background-color: white;
	margin: 100px 20px 20px; 
}

/* 메인 콘텐츠 스타일 */
/*
#content {
	margin-left: 220px; /* 사이드바 너비 + 여백
	padding: 20px;
}
*/
</style>
</html>