<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<!-- 반응형 웹 페이지 -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<!-- css -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
		<link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/common.css"/>
		<link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/jquery-ui.css">
		<link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/style.css"/>
		<!-- js -->
		<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
		<script src="<%=request.getContextPath()%>/static/js/mngr-sidebar.js"></script>
		<script src="<%=request.getContextPath()%>/static/js/datepicker.js"></script>
		<script src="<%=request.getContextPath()%>/static/js/mngr-user-list.js"></script>
		<!-- icon -->
		<link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/static/images/common/favicon.ico">
		<title>Shape - 관리자</title>
	</head>
	<body>
		<div class="d-flex">
			<%@ include file="../../common/mngr_sidebar.jsp" %>
			
			<div class="vh-100 vw-100 p-3">
				<span>사용자 관리</span>
				<hr>
				<!-- 검색 영역 -->
				<div class="card mb-3">
					<div class="card-header text-white bg-dark">검색 영역</div>
					<form action="/shape/mngr/user/list" method="get" id="searchForm">
						<div class="card-body g-3">
							<div class="row g-3">
								<div class="col-6">
									<div class="form-group row">
										<label for="id" class="col-2 col-form-label">아이디</label>
										<div class="col-10">
											<input id="id" type="text" name="searchId" value="${ search.searchId }" class="form-control w-25"/>
										</div>								
									</div>
								</div>
								<div class="col-6">
									<div class="form-group row">
										<label class="col-2 col-form-label">가입일자</label>
										<div class="col-4">
											<div class="input-group">
												<div class="input-group-prepend">
													<span class="input-group-text bg-dark border-dark">
														<i class="bi bi-calendar text-white"></i>
													</span>
												</div>
												<input class="datepicker form-control" name="searchRegDateStart" value="${ search.searchRegDateStart }"/>
											</div>
										</div>		
										~
										<div class="col-4">
											<div class="input-group">
												<div class="input-group-prepend">
													<span class="input-group-text bg-dark border-dark">
														<i class="bi bi-calendar text-white"></i>
													</span>
												</div>
												<input class="datepicker form-control" name="searchRegDateEnd" value="${ search.searchRegDateEnd }">
											</div>
										</div>				
									</div>
								</div>
								<div class="col-6">
									<div class="form-group row">
										<label for="phone" class="col-2 col-form-label">전화번호</label>
										<div class="col-10">
											<input id="phone" type="text" name="searchPhone" class="form-control w-50" value="${ search.searchPhone }"/>
										</div>								
									</div>
								</div>
								<div class="col-6">
									<div class="form-group row">
										<label for="email" class="col-2 col-form-label">이메일</label>
										<div class="col-10">
											<input id="email" type="text" name="searchEmail" class="form-control w-50" value="${ search.searchEmail }"/>
										</div>								
									</div>
								</div>
								<input type='hidden' name='pageNum' value='${ paging.cri.pageNum }' />
								<input type='hidden' name='amount' value='${ paging.cri.amount }' />
								<div class="d-grid gap-2 d-md-flex justify-content-md-center">
									<button id="btnSearch" class="btn btn-primary" type="button">검색</button>
		  							<button id="btnResetSearch" class="btn btn-dark" type="button">초기화</button>
								</div>
							</div>						
						</div>
					</form>
				</div>


				<!-- 사용자 리스트 -->
				<table class="table table-hover align-middle text-center users">
					<colgroup>
						<col width="5%">
						<col width="20%">
						<col width="20%">
						<col width="30%">
					</colgroup>
					<thead class="table-dark">
						<tr>
							<th>NO</th>
							<th>아이디</th>
							<th>이름</th>
							<th>연락처</th>
							<th>가입일자</th>
						</tr>
					</thead>
					<%-- 
					<tr>
						<td colspan="5">
							${ users }
						</td>
					</tr>
					 --%>
					<tbody id="userList">
						<c:forEach items="${ list }" var="user" varStatus="state">
							<c:url value="/mngr/user/detail" var="detail">
								<c:param name="id" value="${ user.id }"/>
							</c:url>
							<tr onClick="location.href='${ detail }'">
								<td>${ user.rn }</td>
								<td>${ user.id }</td>
								<td>${ user.name }</td>
								<td>${ user.phone }</td>
								<c:set var="join" value="${ user.join_date }"/>
								<td>${ fn:substring(join, 0, 10) }</td>
							</tr>
						</c:forEach>
					</tbody>					
				</table>
				
				<!-- 페이징 -->
				<div>
					<nav>
						<ul class="pagination justify-content-center">
							<li class="page-item ${ paging.prev ? '' : 'disabled' }">
								<a class="page-link" href="${ paging.startPage -1 }" tabindex="-1">Previous</a>
							</li>
							<c:forEach begin="${ paging.startPage }" end="${ paging.endPage }" var="num">
								<li class="page-item ${ paging.cri.pageNum == num? "active":"" }">
									<a class="page-link" href="${ num }">${ num }</a>
								</li>
							</c:forEach>
							<li class="page-item ${ paging.next? '' : 'disabled' }" >
								<a class="page-link" href="${ paging.endPage +1 }" tabindex="-1">Next</a>
							</li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</body>
</html>