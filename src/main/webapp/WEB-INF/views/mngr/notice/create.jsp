<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta charset="UTF-8">
		<!-- 반응형 웹 페이지 -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<!-- css -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
		<link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/common.css"/>
		<!-- js -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
		<script src="<%=request.getContextPath()%>/static/js/mngr-sidebar.js"></script>
		<!-- icon -->
		<link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/static/images/common/favicon.ico">
		<title>Shape - 관리자</title>

	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
		integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
		crossorigin="anonymous"></script>
	
	</head>
	<body>
		<div class="d-flex">
		<%@ include file="../../common/mngr_sidebar.jsp"%>
		<div class="vh-100 vw-100 p-3">
		<header class="my-2 p-5 text-center">
			<h1 class="titleBolder">공지사항</h1>
			<p>관리자</p>
		</header>

			<div class="card">
				<form method="post" encType="multipart/form-data">
					<div class="card-body">
						<div class="my-2">
							<label class="form-label" for="title">제목</label> 
							<input class="form-control" type="text" id="title" name="title"
								required autofocus />
						</div>
						<div class="my-2">
							<label class="form-label" for="summernote">내용</label>
							<textarea class="form-control" id="summernote" name="content" required></textarea>
						</div>
						
						<br />
						
						<div class="my-2">
							<small style="color: red;">* 파일은 하나만 업로드 가능합니다</small>
							<input class="form-control" type="file" id="atchd_file" name="uploadFile" />
						</div>
						
						<br />
						
						<div class="form-check"> <!-- 글 고정 체크박스 -->
							<label class="form-check-label" for="checkbox">고정</label>
							<input class="form-check-input" type=checkbox name="fix" id="checkbox" value="-1"/>
						</div>
					</div>
					
				</form>
			</div>
			<div class="my-2 text-center">
						<c:url var="noticeList" value="/mngr/notice/list" />
						<a class="btn" href="${ noticeList }" style="background-color: #D3FF31;">목록</a>
						<button class="btn" type="submit" id="btnCreateNotice" style="background-color: #D3FF31;">
							등록
						</button>
			</div>

		<script src="<%=request.getContextPath()%>/static/js/notice-summernote.js"></script>
	</div>
	</div>	
		
	</body>
</html>