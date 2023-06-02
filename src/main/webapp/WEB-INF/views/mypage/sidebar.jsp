<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div id="sidebar">
    
    <ul>
    	<h5>회원정보</h5>
    	<li>
    		<a href="user/myprofile">-나의 프로필</a>
    	</li>
    	<li>
    		<a href="user/pwdmodify">-비밀번호 수정</a>
    	</li>
    	<li>
    		<a href="user/withdrawal">-회원탈퇴(beta)</a>
		</li>
    	<h5>모임</h5>
    	<li>
    		<a href="user/active">-내가 참여 중인 모임</a>
    	</li>
    	<li>
			<a href="user/created">-내가 개설한 모임</a>
		</li>
    	<li>
    		<a href="user/interests">-내가 찜한 모임</a>
    	</li>
    	<li>
    		<a href="user/viewed">-최근 본 모임(beta)</a>
    	</li>
    	<h5>게시판</h5>
    	<li>
    		<a href="user/myposts">-내가 작성한 게시글</a>
    	</li>
    	<li>
    		<a href="user/mycomments">-내가 작성한 댓글</a>
    	</li>
    </ul>
</div>

<style>
    /* 사이드바 스타일 */
    /* id가 sidebar인 요소 선택(#)*/
    #sidebar {
        position: fixed;
        top: 0;
        left: 0;
        width: 200px;
        height: 100%;
        background-color: #f0f0f0;
        padding: 20px;
    }

    /* 메인 콘텐츠 스타일 */
    #content {
        margin-left: 220px; /* 사이드바 너비 + 여백 */
        padding: 20px;
    }
</style>