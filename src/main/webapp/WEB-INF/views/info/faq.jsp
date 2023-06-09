<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../common/header.jsp"%>
<div class="container">

	<div class="my-2 p-3 text-center">
		<h1 class="titleBolder">FAQ</h1>
	</div>

		<div class="accordion " id="accordionExample">
			<c:forEach items="${ faqs }" var="faq" varStatus="status">
				<div class="accordion-item " role="tabpanel"
					aria-labelledby="headingOne">
					<h2 class="accordion-header" id="flush-headingOne">
						<button class="accordion-button bg-white fw-bold collapsed" type="button" data-bs-toggle="collapse" 
							data-bs-target="#faq${ status.index }" aria-expanded="true" aria-controls="faq${ status.index }">
							<h1><i class="bi bi-question-lg subColor"></i></h1>
							<br/>
							${ faq.question }
							<br/><br/> 
						</button>
					</h2>
					<div id="faq${ status.index }" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
						<div class="accordion-body">
							<h1><i class="bi bi-exclamation-lg mainColor"></i></h1>
							${ faq.answer }<br/>
							<br/>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>

</div>
<%@ include file="../common/footer.jsp"%>