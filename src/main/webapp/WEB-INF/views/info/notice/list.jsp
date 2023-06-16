<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
		<div class="container">
			<div class="my-2 p-3 text-center">
				<h1 class=“titleBolder”>공지사항</h1>
			</div>
		
			<main class="my-2">
				<div class="card">
					<table class="card-body table table-hover text-center">
						<thead>
							<tr>
								<th scope="col">No</th>
								<th scope="col">제목</th>
								<th scope="col">작성일</th>
							</tr>
						</thead>
						<tbody class="table-group-divider">
							<c:forEach items="${ notices }" var="notice" varStatus="status">
								<tr class="border">
									<c:choose>
										<c:when test="${ notice.fix == -1 }">
											<th scope="row" class="col-1 text-center">📢</th>
										</c:when>
										<c:otherwise>
											<!--<td>${ notice.nid }</td>  -->
											<th scope="row" class="col-1 text-center">${ status.count }</th>
										</c:otherwise>
									</c:choose>
									<td class="ms-2 text-start">
										<c:url var="noticeDetailPage" value="/info/notice/detail">
											<c:param name="nid" value="${ notice.nid }"></c:param>
										</c:url>
										<a class="link-offset-2 link-underline link-underline-opacity-0 link-dark" 
											href="${ noticeDetailPage }">${ notice.title }</a>
									</td>
									<td class="col-2 text-center"><fmt:formatDate value="${ notice.created_date }" pattern="yyyy-MM-dd"/></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					
					<!-- 페이징 처리 -->
				<div class="pb-3">
					<nav>
						<ul class="pagination justify-content-center">
							<li class="page-item ${ paging.prev? "":"disabled" }"><a
								class="page-link" href="${ paging.startPage -1 }" tabindex="-1">&laquo;</a></li>
							<c:forEach begin="${ paging.startPage }" end="${ paging.endPage }"
								var="num">
								<li class="page-item ${ paging.cri.pageNum == num? "active":"" }"><a
									class="page-link" href="${ num }">${ num }</a></li>
							</c:forEach>
							<li class="page-item ${ paging.next? "":"disabled" }" ><a
								class="page-link" href="${ paging.endPage +1 }" tabindex="-1">&raquo;</a></li>
						</ul>
					</nav>
				</div>
	
				<form id='actionForm' action='/shape/info/notice/list' method='get'>
					<input type='hidden' name='pageNum' value='${ paging.cri.pageNum }' />
					<input type='hidden' name='amount' value='${ paging.cri.amount }' />
				</form>
				<!-- 페이징 처리 -->
				</div>
				
				
			</main>
		</div>
<script src="<%=request.getContextPath()%>/static/js/paging.js"></script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>