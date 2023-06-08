<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<body>
		<h1>Notice detail</h1>
		<div class="container">
			<main class="my-2">
			<section class="card">
				<div>
					<small>조회수: ${ notices.views }</small>
				</div>
				<div class="card-body">
					<div class="my-4">
						<label class="form-label" for="title">제목</label>
						<input class="form-control" id="title" value="${ notices.title }" readonly />
					</div>
					<div class="my-4">
						<label class="form-label">작성일</label>
						<fmt:formatDate value="${ times }" pattern="yyyy.MM.dd" var="date"/>
						<input class="form-control" id="created_date" value="${ date }" readonly />
					</div>
					<div class="my-4">
						<label clasYTIs="form-label" for="file">첨부파일</label>
						<input class="form-control" id="file" value="${ notices.atchd_file }" readonly />
					</div>
					<div class="my-4">
						<label class="form-label" for="content">내용</label>
						<div class="form-control" id="content" readonly>${ notices.content }</div>
					</div>
				</div>
			</section>
			</main>
		</div>
		<div>
			<div class="my-2 text-center">
				<c:url var="infoNoticeListPage" value="/info/notice/list" />
				<a class="btn btn-primary" href="${ infoNoticeListPage }">목록</a>
			</div>
		</div>


</body>
</html>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>