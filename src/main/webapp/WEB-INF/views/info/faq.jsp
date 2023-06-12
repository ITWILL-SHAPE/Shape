<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE html>
<html>
<body>
	<div class="container mb-55">
	
	<div class="my-2 p-5 text-center">
		<h1>FAQ</h1>
	</div>
	
	<main>
		<div class="accordion" id="accordionExample">
			<c:forEach items="${ faqs }" var="faq" varStatus="status">
				<div class="accordion-item"
					role="tabpanel" aria-labelledby="headingOne">
					<h2 class="accordion-header">
						<button class="accordion-button fw-bold" type="button"
							data-bs-toggle="collapse" data-bs-target="#faq${ status.index }"
							aria-expanded="true" aria-controls="faq${ status.index }" >
							${ faq.question }
						</button> <!-- 질문 자리 -->
					</h2>
					<div id="faq${ status.index }" class="accordion-collapse collapse"
						data-bs-parent="#accordionExample">
						<div class="accordion-body">
							${ faq.answer }
						</div> <!-- 답변 자리 -->
					</div>
				</div>
			</c:forEach>
		</div>
	</main>
	</div>
</body>
</html>
<%@ include file="../common/footer.jsp"%>