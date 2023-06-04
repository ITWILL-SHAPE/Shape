<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE html>
<!-- 지현 게시판 main(list) page -->
<!-- 
게시판 기능 완성하기
> 1. 검색
	keyword 어떻게 읽게함? 
> 2. 조회수
> 3. 말머리 번호로 입력
	0으로 들어가……어캄
> 4. 수정, 삭제
	왜 안되냐 js 적용했는데 post 방식이 아니라는게.. 왜..?
> 5. 작성자 화면에 출력 안됨
	사이트 화면에서 보니까 value 입력이 안되는데 얘만 안되는 이유를 모르겠음
> 6. 페이징
> 7. 댓글 
 -->
<!-- 카드로 2개씩 -->
<html>
<head>
<meta charset="UTF-8">
<title>Shape</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<script type="text/javascript">
document.addEventListener('DOMContentLoaded', () => {
	const searchForm = document.querySelector('#searchForm')
	const search = document.querySelector('input#search');
	// 검색버튼을 클릭
	const btnSearch = document.querySelector('#btnSearch');
    btnSearch.addEventListener('click', () => {
    	// 하면 키워드가 읽혀서 search 페이지로 넘어가게	
    	const keyword = search.value; //<<<< 이게 안들어간다! 어떡함
    	searchForm.action = './search?keyword='+ keyword; 
    	searchForm.method = 'post'; 
    	searchForm.submit(); 
    })
});
</script>
</head>
<body>
	<div class="container-fluid">
		<header class="my-2 p-5 text-center">
			<h1>게시판</h1>
			<!-- 검색 -->
			<div class="my-2 row" id="searchForm">
				<div class="col-10">
					<input class="form-control" type="text" id="search" />
				</div>
				<div class="col-2">
					<!-- !!!!!!검색 만들것!!!!!!! -->
					<c:url var="postSearch" value="/post/search" />
					<button onclick="location.href='${postSearch}'" for="search"
						class="form-control btn btn-outline-warning" id="btnSearch">검색</button>
				</div>
			</div>
			<!-- 글쓰기 버튼 -->
			<div class="my-2 row">
				<c:url var="postCreate" value="/post/create" />
				<button onclick="location.href='${ postCreate }'"
					class="btn btn-warning" type="button">글쓰기</button>
			</div>
		</header>

		<main class="my-2">
			<div class="card">
				<table class="card-body table table-hover">
					<thead>
						<tr>
							<th>No</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${ posts }" var="postInfo">
							<tr>
								<td>${ postInfo.pid }</td>
								<!-- secret 여부에 따라 제목이 달라짐 -->
								<c:if test="${postInfo != null}">
									<c:choose>
										<c:when test="${postInfo.hrs_hd == 1}">
											<td><c:url var="postDetailPage" value="/post/detail">
													<c:param name="pid" value="${ postInfo.pid }" />
												</c:url> <a href="${ postDetailPage }">[모임 후기] ${ postInfo.title }</a></td>
										</c:when>
										<c:when test="${postInfo.hrs_hd == 2 }">
											<td><c:url var="postDetailPage" value="/post/detail">
													<c:param name="pid" value="${ postInfo.pid }" />
												</c:url> <a href="${ postDetailPage }">[사담] ${ postInfo.title }</a></td>
										</c:when>
										<c:when test="${postInfo.hrs_hd == 3 }">
											<td><c:url var="postDetailPage" value="/post/detail">
													<c:param name="pid" value="${ postInfo.pid }" />
												</c:url> <a href="${ postDetailPage }">[기타] ${ postInfo.title }</a></td>
										</c:when>
										<c:otherwise>
											<td><c:url var="postDetailPage" value="/post/detail">
													<c:param name="pid" value="${ postInfo.pid }" />
												</c:url> <a href="${ postDetailPage }">[오류 말머리 수정 필요함] ${ postInfo.title }</a></td>
										</c:otherwise>
									</c:choose>
								</c:if>
								<td>${ postInfo.author }</td>
								<td><fmt:formatDate value="${ postInfo.created_date }"
										pattern="yyyy-MM-dd" /></td>
								<!-- an_title이 null인지 아닌지에 따라 진행상태가 달라짐 -->

							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

		</main>

		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
			crossorigin="anonymous"></script>

	</div>
</body>
</html>
<%@ include file="../common/footer.jsp"%>