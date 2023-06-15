<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@ include file="./header.jsp" %>

<!-- Favicons -->
<link rel="apple-touch-icon"
	href="/docs/5.1/assets/img/favicons/apple-touch-icon.png"
	sizes="180x180">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-32x32.png"
	sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-16x16.png"
	sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.1/assets/img/favicons/manifest.json">
<link rel="mask-icon"
	href="/docs/5.1/assets/img/favicons/safari-pinned-tab.svg"
	color="#7952b3">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#7952b3">

		<!-- access="isAuthenticated()": 인증된 사용자면 true -> 로그인 했으면 보임. -->
		<sec:authorize access="isAuthenticated()">
			<!-- CustomUser 객체 -->
			<p>principal: <sec:authentication property="principal"/></p>
			<!-- UserInfo 객체 -->
			<p>UserInfo : <sec:authentication property="principal.user"/></p>
			<p>사용자 이름: <sec:authentication property="principal.user.name"/></p>
			<p>사용자 아이디: <sec:authentication property="principal.username"/></p>
			<p>사용자 권한 리스트: <sec:authentication property="principal.user.division"/></p>
		</sec:authorize>
		
		<p>
			header랑 footer를 적용하고 싶으시면<br>
			main.jsp와 같이 만들어주세요.<br>
			include header, footer를 하고 안에 body를 써주세요.<br>
			content는 body안에서 써주시면 됩니다.<br>
			또 js와 css를 추가하고 싶으시면 header에 있는 head 부분에 써주시면 됩니다.<br>
			admin은 사이드 바이기 때문에 또 다릅니다.<br>
			admin css를 고칠 때까지 기다려주세요.<br>
			admin은 현재 있는 툴처럼 만드시면 됩니다.<br>
		</p>
		
		
	<div class="container-fluid container">
	<h2>최근 등록된 모임</h2>
			<!--아이템: model.addAttribute("listCount", dto);-->
		<div id="cardList" class="album py-5">
			<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
				<!-- for문 변경가능함 확인해보기. 
	      -> 로그인: header.jsp, main.jsp => 37줄 참고 
	      -> https://baessi.tistory.com/144: 아이디 각 카드마다 다르게 해야 함.
	    -->
				<c:forEach items="${listRecent}" var="cardList" varStatus="status" begin="0" end="2">
					<c:url var="meetDetailPage" value="/meet/maindetail">
						<c:param name="mtid" value="${cardList.mtid}" />
					</c:url>
					<div class="col" style="cursor: pointer;" id="clickEvent"
						onclick="location=href=('${meetDetailPage}');">
						<div class="card shadow-sm image-container position-relative">
							<svg idx="${status.begin}" class="bd-placeholder-img card-img-top"
								width="100%" height="220" xmlns="http://www.w3.org/2000/svg"
								role="img" aria-label="Placeholder: Thumbnail"
								preserveAspectRatio="xMidYMid slice" focusable="false">
	              				<rect width="100%" height="100%" fill="#55595c" />
	           				</svg>
							<!-- 로그인함: 로그인한 사용자만 입력이 가능함. -->
							<sec:authorize access="isAuthenticated()">
								<div class="img-overlay img-right">
									<button id="logInUser">
										<img src="../static/images/sample/like2.svg" alt="toggle-off"
											width="50" class="heart overlay-image overlay-right"
											id="img-heart" onclick="event.stopPropagation(); LikeCheck();" />
									</button>
								</div>
							</sec:authorize>
							<!-- 로그인 안 함 -->
							<sec:authorize access="isAnonymous()">
								<button id="logOutUser" >
									<img src="../static/images/sample/like2.svg" alt="not-move"
										width="50" class="heart overlay-image overlay-right"
										onclick="event.stopPropagation(); alert('로그인 후 찜 가능합니다');" />
								</button>
							</sec:authorize>
							<div>
								<c:choose>
									<c:when test="${cardList.PCNT >= cardList.nm_ppl}">
										<div id="mozipFin${status.begin}">
											<img id="mozipFinImg${status.begin}"
												src="../static/images/sample/mozip_fin.svg" alt="recuriEng"
												width="80" class="overlay-image overlay-left" />
										</div>
									</c:when>
									<c:otherwise>
										<div id="mozipIin${status.begin}">
											<img id="mozipIin${status.begin}"
												src="../static/images/sample/mozip_ing.svg" alt="recuriIng"
												width="80" class="overlay-image overlay-left" />
										</div>
									</c:otherwise>
								</c:choose>
							</div>
	
							<div class="card-body">
								<div class="post-inner">
									<div class="row align-items-center">
										<div class="col-auto" id="post-category${status.begin}">
											${cardList.category}</div>
										<div class="col text-lg-end text-center">
											<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
												fill="currentColor" class="bi bi-suit-heart-fill"
												viewBox="0 0 16 16">
	                     						 <path
													d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z" />
	                   						</svg>
											<span class="text-end" id="heart${status.begin}"> <em>${cardList.LCNT}</em>
											</span>
										</div>
									</div>
									<div id="post-sidoAndTitle${status.begin}">[
										${cardList.sido} ] &lt;${cardList.title}&gt;</div>
									<div id="post-mtDate${status.begin}">
										<span class="map">모집일정: ${cardList.mt_date}</span>
									</div>
								</div>
								<div class="text-lg-end text-center">
									<small class="text-muted"> 모집인원: <span
										id="currentApplicants${status.begin}">${cardList.PCNT}</span> /
										<span id="maxApplicants${status.begin}">${cardList.nm_ppl}</span>
									</small>
								</div>
							</div>
							<!-- card body -->
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	
	<div class="container-fluid container">
		<div>
		<h2>인기 많은 모임</h2>
		<a>More</a>
		</div>
			<!--아이템: model.addAttribute("listCount", dto);-->
		<div id="cardList" class="album py-5">
			<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
				<!-- for문 변경가능함 확인해보기. 
	      -> 로그인: header.jsp, main.jsp => 37줄 참고 
	      -> https://baessi.tistory.com/144: 아이디 각 카드마다 다르게 해야 함.
	    -->
				<c:forEach items="${listPopularity}" var="cardList" varStatus="status" begin="0" end="2">
					<c:url var="meetDetailPage" value="/meet/maindetail">
						<c:param name="mtid" value="${cardList.mtid}" />
					</c:url>
					<div class="col" style="cursor: pointer;" id="clickEvent"
						onclick="location=href=('${meetDetailPage}');">
						<div class="card shadow-sm image-container position-relative">
							<svg idx="${status.begin}" class="bd-placeholder-img card-img-top"
								width="100%" height="220" xmlns="http://www.w3.org/2000/svg"
								role="img" aria-label="Placeholder: Thumbnail"
								preserveAspectRatio="xMidYMid slice" focusable="false">
	              				<rect width="100%" height="100%" fill="#55595c" />
	           				</svg>
							<!-- 로그인함: 로그인한 사용자만 입력이 가능함. -->
							<sec:authorize access="isAuthenticated()">
								<div class="img-overlay img-right">
									<button id="logInUser">
										<img src="../static/images/sample/like2.svg" alt="toggle-off"
											width="50" class="heart overlay-image overlay-right"
											id="img-heart" onclick="event.stopPropagation(); LikeCheck();" />
									</button>
								</div>
							</sec:authorize>
							<!-- 로그인 안 함 -->
							<sec:authorize access="isAnonymous()">
								<button id="logOutUser" >
									<img src="../static/images/sample/like2.svg" alt="not-move"
										width="50" class="heart overlay-image overlay-right"
										onclick="event.stopPropagation(); alert('로그인 후 찜 가능합니다');" />
								</button>
							</sec:authorize>
							<div>
								<c:choose>
									<c:when test="${cardList.PCNT >= cardList.nm_ppl}">
										<div id="mozipFin${status.begin}">
											<img id="mozipFinImg${status.begin}"
												src="../static/images/sample/mozip_fin.svg" alt="recuriEng"
												width="80" class="overlay-image overlay-left" />
										</div>
									</c:when>
									<c:otherwise>
										<div id="mozipIin${status.begin}">
											<img id="mozipIin${status.begin}"
												src="../static/images/sample/mozip_ing.svg" alt="recuriIng"
												width="80" class="overlay-image overlay-left" />
										</div>
									</c:otherwise>
								</c:choose>
							</div>
	
							<div class="card-body">
								<div class="post-inner">
									<div class="row align-items-center">
										<div class="col-auto" id="post-category${status.begin}">
											${cardList.category}</div>
										<div class="col text-lg-end text-center">
											<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
												fill="currentColor" class="bi bi-suit-heart-fill"
												viewBox="0 0 16 16">
	                     						 <path
													d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z" />
	                   						</svg>
											<span class="text-end" id="heart${status.begin}"> <em>${cardList.LCNT}</em>
											</span>
										</div>
									</div>
									<div id="post-sidoAndTitle${status.begin}">[
										${cardList.sido} ] &lt;${cardList.title}&gt;</div>
									<div id="post-mtDate${status.begin}">
										<span class="map">모집일정: ${cardList.mt_date}</span>
									</div>
								</div>
								<div class="text-lg-end text-center">
									<small class="text-muted"> 모집인원: <span
										id="currentApplicants${status.begin}">${cardList.PCNT}</span> /
										<span id="maxApplicants${status.begin}">${cardList.nm_ppl}</span>
									</small>
								</div>
							</div>
							<!-- card body -->
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>

<script src="<%=request.getContextPath()%>/static/js/meet-list.js"></script>
<%@ include file="./footer.jsp" %>