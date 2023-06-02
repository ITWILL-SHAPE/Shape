<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<div class="accordion" id="accordionExample">
	<ul class="sidebar">
		<li>
			<div class="logo">
				<a class="home" href="">홈</a>
			</div>
		</li>
		<li>
			<div class="accordion-item">
				<h2 class="accordion-header" id="userMng">
					<a href="" class="none-accordion-button">사용자 관리</a>
				</h2>
			</div>
		</li>
		<li>
			<div class="accordion-item">
				<h2 class="accordion-header" id="helper">
					<button class="accordion-button collapsed" type="button"
						data-bs-toggle="collapse" data-bs-target="#helperCollapse"
						aria-expanded="true" aria-controls="collapseOne">
						도움말
					</button>
				</h2>
				<div id="helperCollapse" class="accordion-collapse collapse"
					aria-labelledby="helper" data-bs-parent="#accordionExample">
					<div class="accordion-body">
						<ul>
							<li>
							    <c:url value="/mngr/notice/list" var="mngrNoticeListPage"></c:url>
								<a href="${ mngrNoticeListPage }">공지사항</a>
							</li>
							<li>
								<c:url value="/mngr/faq/list" var="mngrFaqListPage"></c:url>
								<a href="${ mngrFaqListPage }">FAQ</a>
							</li>
							<li>
								<c:url value="/mngr/qna/list" var="mngrQnAListPage"></c:url>
								<a href="${ mngrQnAListPage }">Q&amp;A</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</li>
		<li>
			<div>
				<a href="" class=""><i class="bi bi-person after-login"></i></a>
				<a href="">로그아웃</a>
			</div>
		</li>
	</ul>
</div>

<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>