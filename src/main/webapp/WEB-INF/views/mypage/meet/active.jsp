<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../common/header.jsp"%>
<body>
	<div class="row">
		<div class="col-2"></div>
		<div class="col-10">
			<div class="my-2 p-3 text-center">
				<h1 class="titleBolder" >내가 참여 중인 모임</h1>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-2">
			<%@ include file="../sidebar.jsp"%>
		</div>

		<div class="container myPage-container col-8 border bg-body rounded shadow-sm" id="main_content">
				<!--아이템: model.addAttribute("activeList", dto);-->
				<div id="cardList" class="album py-5 ">
					<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
						<!-- for문 변경가능함 확인해보기. 
      -> 로그인: header.jsp, main.jsp => 37줄 참고 
      -> https://baessi.tistory.com/144: 아이디 각 카드마다 다르게 해야 함.
    -->
						<c:forEach items="${ activeList }" var="activeList"
							varStatus="status">
							<c:url var="meetDetailPage" value="/meet/maindetail">
								<c:param name="mtid" value="${activeList.mtid}" />
							</c:url>
							<div class="col" style="cursor: pointer;" id="clickEvent"
								onclick="window.open('${meetDetailPage}');">
								<div class="card shadow-sm image-container position-relative">
									<svg idx="${status.begin}"
										class="bd-placeholder-img card-img-top"
										xmlns="http://www.w3.org/2000/svg"
										aria-label="Placeholder: Thumbnail"
										preserveAspectRatio="xMidYMid slice" width="100%" height="220"
										role="img" focusable="false">
              				<rect width="100%" height="100%" fill="#55595c" />
           				</svg>
									<!-- 로그인함: 로그인한 사용자만 입력이 가능함. -->
									<sec:authorize access="isAuthenticated()">
										<button id="logInUser">
											<img src="./static/images/sample/like2.svg"
												class="heart overlay-image overlay-right" width="50"
												alt="toggle-off" onclick="alert(확인)" />
										</button>
									</sec:authorize>
									<!-- 로그인 안 함 -->
									<sec:authorize access="isAnonymous()">
										<button id="logOutUser">
											<img src="./static/images/sample/like2.svg"
												class="heart overlay-image overlay-right" width="50"
												alt="toggle-off" onclick="alert(확인)" />
										</button>
									</sec:authorize>
									<div>
										<c:choose>
											<c:when test="${activeList.PCNT >= activeList.nm_ppl}">
												<div id="mozipFin${status.begin}">
													<img id="mozipFinImg${status.begin}"
														src="./static/images/sample/mozip_fin.svg"
														class="overlay-image overlay-left" width="80"
														alt="recuriEng" />
												</div>
											</c:when>
											<c:otherwise>
												<div id="mozipIin${status.begin}">
													<img id="mozipIin${status.begin}"
														src="./static/images/sample/mozip_ing.svg"
														class="overlay-image overlay-left" width="80"
														alt="recuriIng" />
												</div>
											</c:otherwise>
										</c:choose>
									</div>
									<!-- 카드 시작 -->
									<div class="card-body">
										<div class="post-inner">
											<div class="row align-items-center">
												<div class="col-auto" id="post-category${status.begin}">
													${activeList.category}</div>
												<div class="col text-lg-end text-center">
													<svg xmlns="http://www.w3.org/2000/svg"
														class="bi bi-suit-heart-fill" viewBox="0 0 16 16"
														width="16" height="16" fill="currentColor">
                     						 <path
															d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z" />
                   						</svg>
													<span class="text-end" id="heart${status.begin}"> <em>${activeList.LCNT}</em>
													</span>
												</div>
											</div>
											<div id="post-sidoAndTitle${status.begin}">
												[${activeList.sido} ] &lt;${activeList.title}&gt;</div>
											<div id="post-mtDate${status.begin}">
												<span class="map">모집일정: ${activeList.mt_date}</span>
											</div>
										</div>
										<div class="text-lg-end text-center">
											<small class="text-muted"> 모집인원: <span
												id="currentApplicants${status.begin}">${activeList.PCNT}</span>
												/ <span id="maxApplicants${status.begin}">${activeList.nm_ppl}</span>
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
		</div>
	</div>
	<!-- 메인 컨텐츠 끝 -->
</body>
<footer>
	<%@ include file="../../common/footer.jsp"%>
</footer>