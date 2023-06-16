<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../common/header.jsp"%>
<div class="container">

	<div class="my-2 p-5 text-center">
		<h1>FAQ</h1>
	</div>

		<div class="accordion " id="accordionExample">
			<c:forEach items="${ faqs }" var="faq" varStatus="status">
				<div class="accordion-item " role="tabpanel"
					aria-labelledby="headingOne">
					<h2 class="accordion-header">
						<button class="accordion-button bg-white fw-bold" type="button"
							data-bs-toggle="collapse" data-bs-target="#faq${ status.index }"
							aria-expanded="true" aria-controls="faq${ status.index }">
							
							<h1><i class="bi bi-question-lg"></i></h1>
							<br/>
							${ faq.question }
							<br/><br/> </button>
						<!-- 질문 자리 -->
					</h2>
					<div id="faq${ status.index }" class="accordion-collapse collapse"
						data-bs-parent="#accordionExample">
						<div class="accordion-body">
							<h1><i class="bi bi-exclamation-lg"></i></h1>
							${ faq.answer }<br/>
							<br/>
						</div>
						<!-- 답변 자리 -->
					</div>
				</div>
			</c:forEach>
		</div>

	


</div>
<%@ include file="../common/footer.jsp"%>