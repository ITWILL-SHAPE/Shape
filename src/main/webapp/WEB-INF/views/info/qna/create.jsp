<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!DOCTYPE html>
<!-- 지현 qna main(list) page -->
<html>
<head>
<meta charset="UTF-8">
<title>Shape</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
</head>
<body>
	<div class="container-fluid">
		<header class="my-2 p-5 text-center">
			<h1>Q&amp;A</h1>
			<p>문의를 남겨주시면 영업시간(09:30 ~ 17:30)내에 답변드리겠습니다.</p>
		</header>

		<main class="my-2">
			<div class="card">
				<form method="post">
					<div class="card-body">
						<div class="my-2">
							<label class="form-label" for="title">제목</label> <input
								class="form-control" type="text" id="title" name="title"
								required autofocus />
						</div>
						<div class="my-2">
							<label class="form-label" for="content">내용</label>
							<textarea class="form-control" id="content" name="content"
								required></textarea>
						</div>
						<div class="my-2">
							<label class="form-label" for="writer">작성자 아이디</label> <input
								class="form-control" type="text" id="writer" name="writer"
								required />
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox" value="Y"
								id="secret" name="secret"> <label class="form-check-label"
								for="flexCheckDefault"> 비밀글 </label>
						</div>
					</div>
					<div class="card-footer my-2">
						<input class="form-control btn btn-outline-primary" type="submit"
							value="작성 완료" />
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
<%@ include file="/WEB-INF/views/common/header.jsp"%>