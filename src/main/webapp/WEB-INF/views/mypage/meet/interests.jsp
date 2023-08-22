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
				<h1 class="titleBolder">내가 찜한 모임</h1>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-2">
			<%@ include file="../sidebar.jsp"%>
		</div>

		<div
			class="container myPage-container col-8 border bg-body rounded shadow-sm"
			id="main_content">
			<!--아이템: model.addAttribute("interestsList", dto);-->
			<div id="cardList" class="album py-5">
				<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
					<!-- for문 변경가능함 확인해보기. 
      -> 로그인: header.jsp, main.jsp => 37줄 참고 
      -> https://baessi.tistory.com/144: 아이디 각 카드마다 다르게 해야 함.
    -->
					<c:forEach items="${ interestsList }" var="interestsList"
						varStatus="status">
						<c:url var="meetDetailPage" value="/meet/maindetail">
							<c:param name="mtid" value="${interestsList.mtid}" />
						</c:url>
						<div class="col" style="cursor: pointer;" id="clickEvent"
							onclick="location=href=('${meetDetailPage}');">
							<div class="card shadow-sm image-container position-relative">
								<c:choose>
									<c:when test="${ interestsList.file != null}">
										<!-- 저장할 때 img면 파일 확장자가 png, jpg, gif 등인지 확인하고 저장하고 img로 뿌려주기 -->
										<c:set value="data:image/png;base64, ${ interestsList.file }"
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
								<img src="./static/images/sample/like.svg" alt="toggle-off"
									width="50" class="heart overlay-image overlay-right"
									onclick="alert(확인)" />


								<div>
									<c:set var="today" value="<%=new java.util.Date()%>" />
									<c:set var="date"><fmt:formatDate value="${today}" pattern="yyyy-MM-dd" /></c:set>
									<c:choose>
										<c:when
											test="${interestsList.PCNT >= interestsList.nm_ppl || interestsList.ed_date < date}">
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


								<!-- 카드 시작 -->
								<div class="card-body">
									<div class="post-inner">
										<div class="row align-items-center">
											<div class="col-auto" id="post-category${status.begin}">
												${interestsList.category}</div>
											<div class="col text-lg-end text-center">
												<svg xmlns="http://www.w3.org/2000/svg" width="16"
													height="16" fill="currentColor"
													class="bi bi-suit-heart-fill" viewBox="0 0 16 16">
                     						 <path
														d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z" />
                   						</svg>
												<span class="text-end" id="heart${status.begin}"> <em>${interestsList.LCNT}</em>
												</span>
											</div>
										</div>
										<div class="titleHidden" id="post-sidoAndTitle${status.begin}">[
											${interestsList.sido} ] &lt;${interestsList.title}&gt;</div>
										<div id="post-mtDate${status.begin}">
											<span class="map">모집일정: ${interestsList.mt_date}</span>
										</div>
									</div>
									<div class="text-lg-end text-center">
										<small class="text-muted"> 모집인원: <span
											id="currentApplicants${status.begin}">${interestsList.PCNT}</span>
											/ <span id="maxApplicants${status.begin}">${interestsList.nm_ppl}</span>
										</small>
									</div>
								</div>
								<!-- 카드 끝 -->
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<!-- 페이징 -->
			<div class="mb-3">
				<nav>
					<ul class="pagination justify-content-center">
						<li class="page-item ${ pageMaker.prev ? '' : 'disabled' }"><a
							class="page-link"
							href="/shape/active?id=${ id }&pageNum=${ pageMaker.startPage -1 }"
							tabindex="-1">&laquo;</a></li>
						<c:forEach begin="${ pageMaker.startPage }"
							end="${ pageMaker.endPage }" var="num">
							<li class="page-item ${ pageMaker.cri.pageNum == num? "active":"" }">
								<a class="page-link"
								href="/shape/active?id=${ id }&pageNum=${ num }">${ num }</a>
							</li>
						</c:forEach>
						<li class="page-item ${ pageMaker.next? '' : 'disabled' }"><a
							class="page-link"
							href="/shape/active?id=${ id }&pageNum=${ pageMaker.endPage + 1 }"
							tabindex="-1">&raquo;</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
	<!-- 메인 컨텐츠 끝 -->
</body>
<footer>
	<%@ include file="../../common/footer.jsp"%>
</footer>