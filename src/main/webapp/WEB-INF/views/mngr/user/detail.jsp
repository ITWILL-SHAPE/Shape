<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
				<span>사용자 관리 > 사용자 상세보기</span>
				<hr>
				<!-- 사용자 상세보기 -->
				<table class="table align-middle text-center table-bordered">
					<colgroup>
						<col width="10%">
					</colgroup>
					<tbody>
						<tr>
							<th>아이디</th>
							<td class="text-start">
								${ user.id }
							</td>
						</tr>
						<tr>
							<th>이름</th>
							<td class="text-start">
								${ user.name }
							</td>
						</tr>
						<tr>
							<th>성별</th>
							<td class="text-start">
								<c:choose>
									<c:when test="${ user.gender eq 'M'}">
										남자
									</c:when>
									<c:otherwise>
										여자
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
						<tr>
							<th>생년월일</th>
							<td class="text-start">
								${ user.birth }							
							</td>
						</tr>
						<tr>
							<th>휴대폰</th>
							<td class="text-start">
								${ user.phone }							
							</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td class="text-start">
								${ user.email }
							</td>
						</tr>
					</tbody>
				</table>
				<div class="text-center">
					<c:url value="/mngr/user/list" var="list"/>
					<a href="${ list }" class="btn btn-primary" type="button">
						리스트
					</a>
				</div>				
			</div>
		</div>
	</body>
</html>