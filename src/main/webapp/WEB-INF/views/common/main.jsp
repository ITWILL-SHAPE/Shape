<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="./header.jsp"%>

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

<div id="detaillmain" class="container">
	<div class="card border-0">
		<div class="card-body">
			<div class="my-5">
				<div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
					<div class="carousel-indicators">
						<button type="button" data-bs-target="#myCarousel"
							data-bs-slide-to="0" class="" aria-label="Slide 1"></button>
						<button type="button" data-bs-target="#myCarousel"
							data-bs-slide-to="1" aria-label="Slide 2" class="active"
							aria-current="true"></button>
						<button type="button" data-bs-target="#myCarousel"
							data-bs-slide-to="2" aria-label="Slide 3" class=""></button>
					</div>
					<!-- 1번째 -->
					<div class="carousel-inner">
						<div class="carousel-item">
							<img
								src="<%=request.getContextPath()%>/static/images/common/mainImage.png"
								class="bd-placeholder-img" width="100%" height="100%" />
							<div class="container">
								<div class="carousel-caption text-start"></div>
							</div>
						</div>
						<!-- 2번째 -->
						<div class="carousel-item active">
							<c:url var="meetListPage" value="/meet/list"></c:url>
							<a href="${meetListPage}"> <img
								src="<%=request.getContextPath()%>/static/images/common/mainImage3.png"
								class="bd-placeholder-img" width="100%" height="100%" />
							</a>
							<div class="container">
								<div class="carousel-caption"></div>
							</div>
						</div>
						<!-- 3번째 -->
						<div class="carousel-item">
							<c:url var="postListPage" value="/post/list"></c:url>
							<a href="${ postListPage }"> <img
								src="<%=request.getContextPath()%>/static/images/common/mainImage2.png"
								class="bd-placeholder-img" width="100%" height="100%" />
							</a>
							<div class="container">
								<div class="carousel-caption text-end">
									<p class="black"></p>
								</div>
							</div>
						</div>
					</div>
					<button class="carousel-control-prev" type="button"
						data-bs-target="#myCarousel" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#myCarousel" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
			</div>
		</div>
	</div>
</div>


<div class="container-fluid container py-5">
	<div class="row my-3">
		<h2 class="col-11 mainH2">최근 등록된 모임</h2>
		<c:url var="meetListPage" value="/meet/list"></c:url>
		<a class="col-1 mainA" href="${ meetListPage }">More ></a>
	</div>
	<!--아이템: model.addAttribute("listCount", dto);-->
	<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
		<!-- for문 변경가능함 확인해보기. 
	      -> 로그인: header.jsp, main.jsp => 37줄 참고 
	      -> https://baessi.tistory.com/144: 아이디 각 카드마다 다르게 해야 함.
	    -->
		<c:forEach items="${ listRecent }" var="cardList" varStatus="status"
			begin="0" end="2">
			<c:url var="meetDetailPage" value="/meet/maindetail">
				<c:param name="mtid" value="${cardList.mtid}" />
			</c:url>
			<div class="col" style="cursor: pointer;" id="clickEvent"
				onclick="location=href=('${meetDetailPage}');">
				<div class="card shadow-sm image-container position-relative">
					<c:choose>
						<c:when test="${ cardList.file != null }">
							<!-- 저장할 때 img면 파일 확장자가 png, jpg, gif 등인지 확인하고 저장하고 img로 뿌려주기 -->
							<c:set value="data:image/png;base64, ${ cardList.file }"
								var="url" />
							<img src="${ url }" class="bd-placeholder-img card-img-top"
								width="100%" height="220" xmlns="http://www.w3.org/2000/svg"
								aria-label="Placeholder: Thumbnail"
								preserveAspectRatio="xMidYMid slice" focusable="false" />
						</c:when>
						<c:otherwise>
							<img
								src="<%=request.getContextPath()%>/static/images/common/BasicMeetImg.png"
								class="bd-placeholder-img card-img-top" width="100%"
								height="220" xmlns="http://www.w3.org/2000/svg"
								aria-label="Placeholder: Thumbnail"
								preserveAspectRatio="xMidYMid slice" focusable="false" />
							<rect width="100%" height="100%" fill="#55595c" />
							</svg>
						</c:otherwise>
					</c:choose>
					<!-- 로그인함: 로그인한 사용자만 입력이 가능함. -->
					<sec:authorize access="isAuthenticated()">
						<sec:authentication property="principal.username" var="loginUser" />
						<input class="d-none" id="mtid" value="${ cardList.mtid }" />
						<input class="d-none" id="id" value="${loginUser}" />
						<c:set var="author" value="${ cardList.CRTR_ID }" />
						<c:set value="false" var="loop" />
						<c:forEach items="${like}" var="like" varStatus="likeStatus">
							<c:set value="${ like.mtid == cardList.mtid }" var="mtIdBoolean" />
							<c:set value="${ loginUser eq cardList.CRTR_ID }"
								var="mtAuthorBoolean" />
							<c:set value="${ like.id eq loginUser }" var="loginUserBoolean" />

							<%-- <c:out value="${ (mtIdBoolean && loginUserBoolean) && loop}"></c:out> --%>
							<c:if test="${ (mtIdBoolean && loginUserBoolean) && loop }">
								<input class="d-none" id="likeMtid" value="${ like.mtid }" />
								<img src="./static/images/sample/like.svg" alt="toggle-off"
									width="40" class="heart overlay-image overlay-right"
									id="img-heart${likeStatus.index}" />
								<c:set value="true" var="loop" />
							</c:if>

							<c:if test="${ (mtIdBoolean && mtAuthorBoolean) && loop }">
								<input class="d-none" id="likeMtid" value="${ like.mtid }" />
								<img src="./static/images/sample/like2.svg" alt="toggle-off"
									width="40" class="heart overlay-image overlay-right"
									id="img-heartEd${likeStatus.index}" />
								<c:set value="true" var="loop" />
							</c:if>

							<c:if test="${ (!mtIdBoolean ||  !loginUserBoolean) && !loop }">
								<input class="d-none" id="likeMtid" value="${ like.mtid }" />
								<img src="./static/images/sample/like2.svg" alt="toggle-off"
									width="40" class="heart overlay-image overlay-right"
									id="img-heartEmpty${likeStatus.index}" />
								<c:set value="true" var="loop" />
							</c:if>

						</c:forEach>
					</sec:authorize>
					<sec:authorize access="isAnonymous()">
						<img src="./static/images/sample/like2.svg" alt="not-move"
							width="40" class="heart overlay-image overlay-right"
							onclick="event.stopPropagation(); alert('로그인 후 모임상세보기 창에서 찜 가능합니다');" />
					</sec:authorize>
					<div>
						<c:choose>
							<c:when test="${cardList.PCNT >= cardList.nm_ppl}">
								<div id="mozipFin${status.begin}">
									<img id="mozipFinImg${status.begin}"
										src="./static/images/sample/mozip_fin.svg" alt="recuriEng"
										width="80" class="overlay-image overlay-left" />
								</div>
							</c:when>
							<c:otherwise>
								<div id="mozipIin${status.begin}">
									<img id="mozipIin${status.begin}"
										src="./static/images/sample/mozip_ing.svg" alt="recuriIng"
										width="80" class="overlay-image overlay-left" />
								</div>
							</c:otherwise>
						</c:choose>
					</div>

					<div class="card-body">
						<div class="post-inner">
							<div class="row align-items-center">
								<div class="col-auto fw-bold" id="post-category${status.begin}">
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
							<br>
							<div class="titleHidden fw-bold" id="post-sidoAndTitle${status.begin}">[
								${cardList.sido} ] &lt;${cardList.title}&gt;</div>

							<div id="post-mtDate${status.begin}">
								<span class="map">모임일정: ${cardList.mt_date}</span>
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
<div class="container-fluid container py-5">
	<div class="row my-3">
		<h2 class="col-11 mainH2">인기 많은 모임</h2>
		<c:url var="meetListPage" value="/meet/list"></c:url>
		<a class="col-1 mainA" href="${ meetListPage }">More ></a>
	</div>
	<!--아이템: model.addAttribute("listCount", dto);-->
	<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
		<!-- for문 변경가능함 확인해보기. 
	      -> 로그인: header.jsp, main.jsp => 37줄 참고 
	      -> https://baessi.tistory.com/144: 아이디 각 카드마다 다르게 해야 함.
	    -->
		<c:forEach items="${ listPopularity }" var="cardList"
			varStatus="status" begin="0" end="2">
			<c:url var="meetDetailPage" value="/meet/maindetail">
				<c:param name="mtid" value="${cardList.mtid}" />
			</c:url>
			<div class="col" style="cursor: pointer;" id="clickEvent"
				onclick="location=href=('${meetDetailPage}');">
				<div class="card shadow-sm image-container position-relative">
					<c:choose>
						<c:when test="${ cardList.file != null }">
							<!-- 저장할 때 img면 파일 확장자가 png, jpg, gif 등인지 확인하고 저장하고 img로 뿌려주기 -->
							<c:set value="data:image/png;base64, ${ cardList.file }"
								var="url" />
							<img src="${ url }" class="bd-placeholder-img card-img-top"
								width="100%" height="220" xmlns="http://www.w3.org/2000/svg"
								aria-label="Placeholder: Thumbnail"
								preserveAspectRatio="xMidYMid slice" focusable="false" />
						</c:when>
						<c:otherwise>
							<img
								src="<%=request.getContextPath()%>/static/images/common/BasicMeetImg.png"
								class="bd-placeholder-img card-img-top" width="100%"
								height="220" xmlns="http://www.w3.org/2000/svg"
								aria-label="Placeholder: Thumbnail"
								preserveAspectRatio="xMidYMid slice" focusable="false" />
							<rect width="100%" height="100%" fill="#55595c" />
							</svg>
						</c:otherwise>
					</c:choose>
					<!-- 로그인함: 로그인한 사용자만 입력이 가능함. -->
					<sec:authorize access="isAuthenticated()">
						<sec:authentication property="principal.username" var="loginUser" />
						<input class="d-none" id="mtid" value="${ cardList.mtid }" />
						<input class="d-none" id="id" value="${loginUser}" />
						<c:set var="author" value="${ cardList.CRTR_ID }" />
						<c:set value="false" var="loop" />
						<c:forEach items="${like}" var="like" varStatus="likeStatus">
							<c:set value="${ like.mtid == cardList.mtid }" var="mtIdBoolean" />
							<c:set value="${ loginUser eq cardList.CRTR_ID }"
								var="mtAuthorBoolean" />
							<c:set value="${ like.id eq loginUser }" var="loginUserBoolean" />

							<%-- <c:out value="${ (mtIdBoolean && loginUserBoolean) && loop}"></c:out> --%>
							<c:if test="${ (mtIdBoolean && loginUserBoolean) && loop }">
								<input class="d-none" id="likeMtid" value="${ like.mtid }" />
								<img src="./static/images/sample/like.svg" alt="toggle-off"
									width="40" class="heart overlay-image overlay-right"
									id="img-heart${likeStatus.index}" />
								<c:set value="true" var="loop" />
							</c:if>

							<c:if test="${ (mtIdBoolean && mtAuthorBoolean) && loop }">
								<input class="d-none" id="likeMtid" value="${ like.mtid }" />
								<img src="./static/images/sample/like2.svg" alt="toggle-off"
									width="40" class="heart overlay-image overlay-right"
									id="img-heartEd${likeStatus.index}" />
								<c:set value="true" var="loop" />
							</c:if>

							<c:if test="${ (!mtIdBoolean ||  !loginUserBoolean) && !loop }">
								<input class="d-none" id="likeMtid" value="${ like.mtid }" />
								<img src="./static/images/sample/like2.svg" alt="toggle-off"
									width="40" class="heart overlay-image overlay-right"
									id="img-heartEmpty${likeStatus.index}" />
								<c:set value="true" var="loop" />
							</c:if>

						</c:forEach>
					</sec:authorize>
					<sec:authorize access="isAnonymous()">
						<img src="./static/images/sample/like2.svg" alt="not-move"
							width="40" class="heart overlay-image overlay-right"
							onclick="event.stopPropagation(); alert('로그인 후 모임상세보기 창에서 찜 가능합니다');" />
					</sec:authorize>
					<div>
						<c:choose>
							<c:when test="${cardList.PCNT >= cardList.nm_ppl}">
								<div id="mozipFin${status.begin}">
									<img id="mozipFinImg${status.begin}"
										src="./static/images/sample/mozip_fin.svg" alt="recuriEng"
										width="80" class="overlay-image overlay-left" />
								</div>
							</c:when>
							<c:otherwise>
								<div id="mozipIin${status.begin}">
									<img id="mozipIin${status.begin}"
										src="./static/images/sample/mozip_ing.svg" alt="recuriIng"
										width="80" class="overlay-image overlay-left" />
								</div>
							</c:otherwise>
						</c:choose>
					</div>

					<div class="card-body">
						<div class="post-inner">
							<div class="row align-items-center">
								<div class="col-auto fw-bold" id="post-category${status.begin}">
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
							<br>
							<div class="titleHidden fw-bold" id="post-sidoAndTitle${status.begin}">[
								${cardList.sido} ] &lt;${cardList.title}&gt;</div>

							<div id="post-mtDate${status.begin}">
								<span class="map">모임일정: ${cardList.mt_date}</span>
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
<div class="container-fluid container py-5">
	<div class="row my-3">
		<h2 class="col-11 mainH2">최근 등록된 게시물</h2>
		<c:url var="postListPage" value="/post/list"></c:url>
		<a class="col-1 mainA" href="${ postListPage }">More ></a>
	</div>
	<div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-3">
		<c:forEach items="${ posts }" var="postInfo" begin="0" end="3">
			<c:url var="postDetailPage" value="/post/detail">
				<c:param name="pid" value="${ postInfo.pid }" />
			</c:url>
			<div class="col" onclick="location.href='${ postDetailPage }'">
				<div class="card my-2 p-3">
					<div class="card-body">
						<!-- 말머리랑 제목 -->
						<h5 class="card-title text-truncate" style="margin-bottom: 20px;">[
							${ postInfo.hrs_hd} ] ${ postInfo.title }</h5>
						<div class="mt-2 grid d-grid d-md-flex">
							<div class="g-col-3">
								<!-- 프로필 사진 -->
								<div class="text-center"
									style="width: 60px; height: 60px; border-radius: 70%; overflow: hidden; margin-right: 15px;">
									<c:if test="${ postInfo.profile == null }">
										<img class=""
											style="width: 100%; height: 100%; object-fit: cover;"
											src="<%=request.getContextPath()%>/static/images/common/user.png" />
									</c:if>
									<c:if test="${ postInfo.profile != null }">
										<c:set value="data:image/png;base64, ${ postInfo.file }"
											var="profile" />
										<img class="" src="${ profile }"
											style="width: 100%; height: 100%; object-fit: cover;" />
									</c:if>
								</div>
							</div>
							<!-- 게시글 작성자 등 -->
							<div class="g-col authorP-div">
								<!-- 작성자 -->
								<p class="fw-bold authorP">${ postInfo.author }</p>
								<p>댓글: ${ postInfo.rcnt }</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>
<script src="<%=request.getContextPath()%>/static/js/meet-list.js"></script>
<%@ include file="./footer.jsp"%>
