<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<body>
		<div class="container">
			<div class="my-2 p-3 text-center">
				<h1 class="titleBolder">공지사항</h1>
			</div>
		
			<section class="card">
				
				<div class="card-body" >
					<!-- 조회수 -->
					<div class="row">
					
					
					<!-- 제목 -->
					<h2 class="col-10 card-title">${ notices.title }</h2>
					<p class="col-2 card-text text-end">조회수: ${ notices.views }</p>
					</div>
					<hr />
					
					
					
					<div class="my-2">
						<label class="form-label d-none" for="content">내용</label>
						<div class="card-text" id="content" readonly>${ notices.content }</div>
					</div>
					
					<hr />
					
					<div class="my-2">
						<label class="form-label" for="file">첨부파일</label>
						<a name="file" data-id="${ notices.nid }" href="">${ notices.file_name }</a>
					</div>
					
					<div class="my-2">
						<label class="form-label d-none" for="created_date">작성일</label>
						<fmt:formatDate value="${ times }" pattern="yyyy-MM-dd" var="date"/>
						<p class="card-text text-end small" id="created_date">${ date }</p>
					</div>
				</div>
				
				
			</section>
			<div class="my-2 text-center">
					<c:url var="infoNoticeListPage" value="/info/notice/list" />
					<a class="btn btn-list col-2" href="${ infoNoticeListPage }">목록</a>
				</div>
		</div>
		
		


</body>
<script src="<%=request.getContextPath()%>/static/js/infoNotice-download.js"></script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>