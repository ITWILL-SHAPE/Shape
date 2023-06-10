<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		<!-- js -->
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
					<div class="card-body g-3">
						<div class="row g-3">
							<div class="col-6">
								<div class="form-group row">
									<label for="id" class="col-2 col-form-label">아이디</label>
									<div class="col-10">
										<input id="id" type="text" name="searchId" class="form-control w-25"/>
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
											<input class="datepicker form-control" name="searchRegDateStart">
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
											<input class="datepicker form-control" name="searchRegDateEnd">
										</div>
									</div>				
								</div>
							</div>
							<div class="col-6">
								<div class="form-group row">
									<label for="phone" class="col-2 col-form-label">전화번호</label>
									<div class="col-10">
										<input id="phone" type="text" name="searchPhone" class="form-control w-50"/>
									</div>								
								</div>
							</div>
							<div class="col-6">
								<div class="form-group row">
									<label for="email" class="col-2 col-form-label">이메일</label>
									<div class="col-10">
										<input id="email" type="text" name="searchEmail" class="form-control w-50"/>
									</div>								
								</div>
							</div>
							<div class="d-grid gap-2 d-md-flex justify-content-md-center">
								<button id="btnSearch" class="btn btn-primary" type="button">검색</button>
	  							<button id="btnResetSearch" class="btn btn-dark" type="button">초기화</button>
							</div>
						</div>						
					</div>
				</div>


				<!-- 사용자 리스트 -->
				<table class="table table-hover align-middle text-center">
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
					<tbody>
						<c:forEach items="${ list }" var="user" varStatus="state">
							
							<tr onClick="">
								<td>${ state.count }</td>
								<td>${ user.id }</td>
								<td>${ user.name }</td>
								<td>${ user.phone }</td>
								<td>${ user.join_date }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>				
			</div>
		</div>
	</body>
</html>