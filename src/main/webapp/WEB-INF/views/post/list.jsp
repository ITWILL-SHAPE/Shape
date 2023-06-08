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
	
	/* const btnSearch = documnet.querySelector('button#btnSearch');
	btnSearch.addEventListener('click', () => {
    	// 하면 키워드가 읽혀서 search 페이지로 넘어가게	
    	const keyword = document.querySelector('input#search').value;
		searchForm.action = './search?keyword='+ keyword; 
    	searchForm.method = 'post'; 
    	searchForm.submit();  
    }) */
    
});
</script>
</head>
<body>
	<div class="container">
		<div class="text-center border bg-body rounded shadow-sm">
		
			<header class="my-2 pt-5 text-center">
				<h1>게시판</h1>
			</header>


			<div class="p-3 m-5 border-0 bd-example m-0 border-0">

				<!-- 글쓰기 버튼 -->
				<div class="d-grid my-2 col-5 mx-auto" style="height: 4rem;">
					<c:url var="postCreate" value="/post/create" />
					<button onclick="location.href='${ postCreate }'"
						class="btn btn-warning" type="button">글쓰기</button>
				</div>

				<div class="row row-cols-1 row-cols-md-2 g-4 p-2">
					<c:forEach items="${ posts }" var="postInfo">
						<c:url var="postDetailPage" value="/post/detail">
							<c:param name="pid" value="${ postInfo.pid }" />
						</c:url>
						<div class="col" onclick="location.href='${ postDetailPage }'">
							<div class="card border-warning my-2 p-3">
								<div class="card-body">
									<!-- 글 번호 -->
									<!-- <div>${ postInfo.pid }</div> -->
									<!-- 말머리랑 제목 -->
									<h5 class="card-title col-6 text-truncate">[ ${ postInfo.hrs_hd} ] ${ postInfo.title }</h5>
									<!-- 작성자 -->
									<p class="card-text">
										작성자: ${ postInfo.author }
										<!-- 작성 날짜 -->
										<br />작성일자:
										<fmt:formatDate value="${ postInfo.created_date }"
											pattern="yyyy-MM-dd" />
									</p>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>


				<!-- 검색 -->
				<c:url var="postSearch" value="/post/search"></c:url>
				<form action="${ postSearch }">
					<div class=" pt-5 w-50 m-auto row">
						<div class="col-sm-10">
							<input class="form-control border-warning" type="text"
								name="keyword" />
						</div>
						<div class="col-sm-2">
							<button type="submit"
								class="form-control btn btn-outline-warning">검색</button>
						</div>
					</div>
				</form>

			</div>

		</div>
	</div>
</body>
</html>
<%@ include file="../common/footer.jsp"%>