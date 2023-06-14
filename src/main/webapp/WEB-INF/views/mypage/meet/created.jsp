<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../common/header.jsp"%>
<head>
<meta charset="UTF-8">
<title>마이페이지 > 모임 > 내가 개설한 모임</title>
</head>
<body>
	<div class="my-2 pt-5" id="sidebar">
		<%@ include file="../sidebar.jsp"%>
	</div>
	<!-- 메인 컨텐츠 시작 -->
		<div class="container-fluid container  my-2 pt-5">
			<!--아이템: model.addAttribute("listCount", dto);-->
			<div id="cardList" class="album py-5">
				<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
					<!-- for문 변경가능함 확인해보기. 
      -> 로그인: header.jsp, main.jsp => 37줄 참고 
      -> https://baessi.tistory.com/144: 아이디 각 카드마다 다르게 해야 함.
    -->
					<c:forEach items="${ createdList }" var="createdList"
						varStatus="status">
						<c:url var="meetDetailPage" value="/meet/maindetail">
							<c:param name="mtid" value="${createdList.mtid}" />
						</c:url>
						<div class="col" style="cursor: pointer;" id="clickEvent"
							onclick="window.open('${meetDetailPage}');">
							<div class="card shadow-sm image-container position-relative">
								<svg idx="${status.begin}"
									class="bd-placeholder-img card-img-top" width="100%"
									height="220" xmlns="http://www.w3.org/2000/svg" role="img"
									aria-label="Placeholder: Thumbnail"
									preserveAspectRatio="xMidYMid slice" focusable="false">
              				<rect width="100%" height="100%" fill="#55595c" />
           				</svg>
								<!-- 로그인함: 로그인한 사용자만 입력이 가능함. -->
								<sec:authorize access="isAuthenticated()">
									<button id="logInUser">
										<img src="./static/images/sample/like2.svg"
											alt="toggle-off" width="50"
											class="heart overlay-image overlay-right" onclick="alert(확인)" />
									</button>
								</sec:authorize>
								<!-- 로그인 안 함 -->
								<sec:authorize access="isAnonymous()">
									<button id="logOutUser">
										<img src="./static/images/sample/like2.svg"
											alt="toggle-off" width="50"
											class="heart overlay-image overlay-right" onclick="" />
									</button>
								</sec:authorize>
								<div>
									<c:choose>
										<c:when test="${createdList.PCNT >= createdList.nm_ppl}">
											<div id="mozipFin${status.begin}">
												<img id="mozipFinImg${status.begin}"
													src="./static/images/sample/mozip_fin.svg"
													alt="recuriEng" width="80"
													class="overlay-image overlay-left" />
											</div>
										</c:when>
										<c:otherwise>
											<div id="mozipIin${status.begin}">
												<img id="mozipIin${status.begin}"
													src="./static/images/sample/mozip_ing.svg"
													alt="recuriIng" width="80"
													class="overlay-image overlay-left" />
											</div>
										</c:otherwise>
									</c:choose>
								</div>


								<!-- 카드 시작 -->
								<div class="card-body">
									<div class="post-inner">
										<div class="row align-items-center">
											<div class="col-auto" id="post-category${status.begin}">
												${createdList.category}</div>
											<div class="col text-lg-end text-center">
												<svg xmlns="http://www.w3.org/2000/svg" width="16"
													height="16" fill="currentColor"
													class="bi bi-suit-heart-fill" viewBox="0 0 16 16">
                     						 <path
														d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z" />
                   						</svg>
												<span class="text-end" id="heart${status.begin}"> <em>${createdList.LCNT}</em>
												</span>
											</div>
										</div>
										<div id="post-sidoAndTitle${status.begin}">[
											${createdList.sido} ] &lt;${createdList.title}&gt;</div>
										<div id="post-mtDate${status.begin}">
											<span class="map">모집일정: ${createdList.mt_date}</span>
										</div>
									</div>
									<div class="text-lg-end text-center">
										<small class="text-muted"> 모집인원: <span
											id="currentApplicants${status.begin}">${createdList.PCNT}</span>
											/ <span id="maxApplicants${status.begin}">${createdList.nm_ppl}</span>
										</small>
									</div>
								</div>
								<!-- 카드 끝 -->
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<!-- 메인 컨텐츠 끝 -->
	<!-- 메인 컨텐츠 끝 -->
</body>
<footer>
	<%@ include file="../../common/footer.jsp"%>
</footer>