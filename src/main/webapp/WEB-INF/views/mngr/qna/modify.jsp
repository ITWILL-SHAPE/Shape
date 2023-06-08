<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../common/mngr_sidebar.jsp"%>
<!DOCTYPE html>
<!-- 지현 qna 관리자 답변하기 page -->
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형 웹 페이지 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- css -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<!-- <link rel="stylesheet" href="../static/css/common.css"/> -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/static/css/common.css" />
<!-- icon -->
<link rel="shortcut icon" type="image/x-icon"
	href="<%=request.getContextPath()%>/static/images/common/favicon.ico">

<script type="text/javascript">
 document.addEventListener('DOMContentLoaded', () => {
     const modifyForm = document.querySelector('#modifyForm');
     
     const btnUpdate = document.querySelector('#btnUpdate');
     btnUpdate.addEventListener('click', () =>{
         // 제목과 내용이 입력되어 있는 지 체크
         const titleInput = document.querySelector('input#an_title').value; //input에 입력된 값
         const content = document.querySelector('textarea#an_comment').value; //textarea에 입력된 값
         if(title === ''||content ===''){
             alert('제목과 내용은 반드시 입력하세요.')
             return;
         }
         const check = confirm('변경 내용을 저장할까요?')
         if(check){
             modifyForm.action = './update?qid=' +${infoQnA.qid};
             modifyForm.method = 'post';
             modifyForm.submit();
         }
     })
 });
</script>

<title>Shape</title>
</head>
<body>
	<%@ include file="../../common/mngr_sidebar.jsp"%>
	<div class="container-fluid">
		<header class="my-2 p-5 text-center">
			<h1>Q&amp;A</h1>
			<p>관리자 답변</p>
		</header>

		<main class="my-2">
			<div class="card">
				<form class="card-body" id="modifyForm">
					<!-- 사용자 문의 출력 -->
					<div class="my-2">
						<label class="form-label" for="qid">번호</label> <input
							class="form-control" id="qid" value="${ infoQnA.qid }" readonly />
					</div>
					<div class="my-2">
						<label class="form-label" for="title">제목</label> <input
							class="form-control" id="title" value="${ infoQnA.title }"
							readonly />
					</div>
					<div class="my-2">
						<label class="form-label" for="content">내용</label>
						<textarea class="form-control" id="content" readonly>${ infoQnA.content }</textarea>
					</div>
					<div class="my-2">
						<label class="form-label" for="author">작성자 아이디</label> <input
							class="form-control" id="author" value="${ infoQnA.writer }"
							readonly />
					</div>
					<div class="my-2">
						<label class="form-label" for="createdTime">작성 날짜</label>
						<fmt:formatDate value="${ infoQnA.created_date }"
							pattern="yyyy-MM-dd" var="created" />
						<input class="form-control" id="createdTime" value="${ created }"
							readonly />
					</div>
					<!-- 관리자 답변 -->
					<div class="my-2">
						<label class="form-label" for="an_title">제목</label> <input
							class="form-control" type="text" id="an_title"
							value="답변드립니다." name="an_title" required readonly />
					</div>
					<div class="my-2">
						<label class="form-label" for="an_comment">답변</label>
						<textarea class="form-control" id="an_comment" name="an_comment"
							required autofocus>${ infoQnA.an_comment }</textarea>
					</div>

					<div class="d-grid gap-2 d-md-flex justify-content-md-end">
						<button class="btn btn-warning" type="button" id="btnUpdate">
							작성 완료</button>
					</div>
				</form>
			</div>

		</main>

		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
			crossorigin="anonymous"></script>

	</div>
</body>
</html>