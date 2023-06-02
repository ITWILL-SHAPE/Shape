<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shape</title>
</head>
<body>
	<div id="body">
	<h1>테스트</h1>
	
	<%-- <div>
		<c:forEach items="${ faqs }" var="faq">
			<dl>
				<dt>${ faq.question }</dt>
				<dd>${ faq.answer }</dd>
			</dl>
		</c:forEach>
	</div> --%>
	
	<hr/>

	<main>
	
		<div class="accordion" id="accordionExample">
			<c:forEach items="${ faqs }" var="faq" varStatus="status">
				<div class="accordion-item"
					role="tabpanel" aria-labelledby="headingOne">
					<h2 class="accordion-header">
						<button class="accordion-button" type="button"
							data-bs-toggle="collapse" data-bs-target="#faq${ status.index }"
							aria-expanded="true" aria-controls="faq${ status.index }">
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
	
	<hr/>

	<%-- <div class="accordion" id="accordionExample">
		<c:forEach items="${ faqs }" var="faq" varStatus="status">
			<div id="collapse${status.index }" class="accordion-item ${status.index eq 0?'panel-collapse collapse in':'panel-collapse collapse'}"
				role="tabpanel" aria-labelledby="headingOne">
				<h2 class="accordion-header">
					<button class="accordion-button" type="button"
						data-bs-toggle="collapse" data-bs-target="#collapseOne"
						aria-expanded="true" aria-controls="collapseOne">
						${ faq.question }
						</button> <!-- 질문 자리 -->
				</h2>
				<div id="collapseOne" class="accordion-collapse collapse show"
					data-bs-parent="#accordionExample">
					<div class="accordion-body">
						<c:out escapeXml="false" value="${fn:replace( ${faq.answer}, '\r\n', '<br>')}" ></c:out>
					</div> <!-- 답변 자리 -->
				</div>
			</div>
		</c:forEach>
	</div> --%>
	<!-- JavaScript Bundle with Popper -->
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>
<%@ include file="../common/footer.jsp"%>