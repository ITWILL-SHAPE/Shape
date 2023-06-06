 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../../common/header.jsp" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 > 게시판 > 내가 작성한 댓글</title>
<style>
body {
    display: flex;
    flex-direction: column;
    min-height: 100vh;
    margin: 0;
}

header {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    background-color: #f1f1f1;
    padding: 20px;
    /* 헤더 스타일링 */
}

footer {
    position: fixed;
    bottom: 0;
    left: 0;
    width: 100%;
    background-color: #f1f1f1;
    padding: 20px;
    /* 푸터 스타일링 */
}

#sidebar {
    position: fixed;
    top: 0;
    left: 0;
    width: 200px;
    height: 100%;
    background-color: #f1f1f1;
    /* 사이드바 스타일링 */
}

#main {
    padding: 20px;
    margin-top: 120px; /* 헤더의 높이 + 여백 */
    margin-left: 220px; /* 사이드바의 너비 + 여백 */
    margin-right: 20px; /* 여백 */
    margin-bottom: 20px; /* 여백 */
    overflow-y: scroll;
    /* 메인 스타일링 */
}

.table {
    /* 테이블 스타일링 */
}
</style>
</head>
<body>
    <header>
        <%@ include file="../../common/header.jsp" %>
    </header>
    
    <div id="sidebar">
        <%@ include file="../sidebar.jsp" %>
    </div>
    
    <div id="main">
        <main>
            <div>
                <table class="table">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>내용</th>
                            <th>작성일</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${mycomments}" var="mycomments" varStatus="loop">
                            <tr>
                                <td>${loop.index + 1}</td>
                                <td>${mycomments.content}</td>
                                <td><fmt:formatDate value="${mycomments.created_date}" pattern="yyyy-MM-dd HH:mm" /></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </main>
    </div>
    
    <footer>
        <%@ include file="../../common/footer.jsp" %>
    </footer>
</body>
</html>
