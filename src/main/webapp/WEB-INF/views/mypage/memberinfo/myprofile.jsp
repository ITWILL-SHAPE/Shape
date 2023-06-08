<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%--
<%@ include file="../../common/header.jsp"%>
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shape</title>
<style>
.center {
   margin: 0 auto; /* 가로 중앙 정렬을 위해 margin을 auto로 설정 */
   text-align: center; /* 내부 텍스트를 가운데 정렬 */
}

.container {
   position: relative;
   padding-top: 200px; /* 헤더의 높이만큼 여백 추가 */
   padding-bottom: 200px; /* 푸터의 높이만큼 여백 추가 */
}

table {
   margin: 0 auto; /* 가로 중앙 정렬을 위해 margin을 auto로 설정 */
   text-align: left; /* 테이블 내부 텍스트를 왼쪽 정렬 */
   border-collapse: collapse; /* 테이블 셀 경계를 병합하여 선을 숨김 */
}

th, td {
   padding: 5px; /* 셀 내부 여백 설정 */
   border: none; /* 셀 경계 선을 없앰 */
}

.profile-container {
   position: relative;
}

.profile-image-container {
   position: relative;
   display: inline-block;
}

.profile-overlay {
   position: absolute;
   top: 0;
   left: 0;
   width: 100%;
   height: 100%;
   background-color: rgba(0, 0, 0, 0.5);
   display: flex;
   justify-content: center;
   align-items: center;
   opacity: 0;
   transition: opacity 0.3s;
}

.profile-overlay:hover {
   opacity: 1;
}

.change-profile-btn {
   border: none;
   background-color: transparent;
   color: white;
   font-size: 16px;
   cursor: pointer;
}
</style>
</head>
<body>
   <div id="sidebar">
   <%--
      <%@ include file="../sidebar.jsp"%>
       --%>
   </div>
   <main>
      <img src="data:image/jpeg;base64,${info.profile}" alt="Profile Image">
      <div class="center">
         <table>
            <tbody>
               <tr>
                  <th>이름</th>
                  <td>${myPageUserInfo.name}</td>
               </tr>
               <tr>
                  <th>성별</th>
                  <td>${myPageUserInfo.gender}</td>
               </tr>
               <tr>
                  <th>아이디</th>
                  <td>${myPageUserInfo.id}</td>
               </tr>
               <tr>
                  <th>생년월일</th>
                  <td>${myPageUserInfo.birth}</td>
               </tr>
               <tr>
                  <th>번호</th>
                  <td>${myPageUserInfo.phone}</td>
               </tr>
               <tr>
                  <th>이메일</th>
                  <td>${myPageUserInfo.email}</td>
               </tr>
            </tbody>
         </table>
      </div>
      <div class="center">
         <c:url var="mypageModifyPage" value="/pwdmodify">
            <c:param name="id" value="${myPageUserInfo.id}"></c:param>
         </c:url>
         <a class="btn btn-outline-primary form-control"
            href="${myPageModifyPage}">회원정보 수정</a>
      </div>
   </main>
</body>

</html>
<%--
<%@ include file="../../common/footer.jsp"%>
 --%>
