<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../common/header.jsp"%>

<div class="container">
	<!-- Title -->
	<div class="my-2 p-3 text-center">
		<h1 class="titleBolder">전체 모임</h1>
	</div>

	<!-- searchForm -->
	<form id="searchMeetList" action="/shape/meet/list" method="get">
		<div class="text-center">
			<div class="w-50 m-auto">
				<input type='hidden' name='pageNum' value='${ paging.cri.pageNum }' />
				<input type='hidden' name='amount' value='${ paging.cri.amount }' />
				<div class="row col-12">
					<!-- 카테고리 -->
					<div class="col-6">
						<select class=" form-select" id="category" name="searchCategory">
							<option value="">모집 분야</option>
							<option value="운동·액티비티"
								${ search.searchCategory eq '운동·액티비티' ? 'selected="selected"' : '' }>운동·액티비티</option>
							<option value="음식·음료"
								${search.searchCategory eq '음식·음료' ? 'selected="selected"' : '' }>음식·음료</option>
							<option value="취미"
								${search.searchCategory eq '취미' ? 'selected="selected"' : '' }>취미</option>
							<option value="여행·동행"
								${search.searchCategory eq '여행·동행' ? 'selected="selected"' : '' }>여행·동행</option>
							<option value="자기계발·교육"
								${search.searchCategory eq '자기계발·교육' ? 'selected="selected"' : '' }>자기계발·교육</option>
							<option value="동네·친목"
								${search.searchCategory eq '동네·친목' ? 'selected="selected"' : '' }>동네·친목</option>
							<option value="문화·예술"
								${search.searchCategory eq '문화·예술' ? 'selected="selected"' : '' }>문화·예술</option>
							<option value="기타"
								${search.searchCategory eq '기타' ? 'selected="selected"' : '' }>기타</option>
						</select>
					</div>
					<!-- 시도 검색 -->
					<div class="col-6">
						<select class="form-select" id="sido" name="searchSidoValue">
							<option value="">---시/도 선택---</option>
							<option value="서울특별시"
								${ search.searchSidoValue eq '서울특별시' ? 'selected="selected"' : '' }>서울특별시</option>
							<option value="인천광역시"
								${search.searchSidoValue eq '인천광역시' ? 'selected="selected"' : '' }>인천광역시</option>
							<option value="대전광역시"
								${search.searchSidoValue eq '대전광역시' ? 'selected="selected"' : '' }>대전광역시</option>
							<option value="광주광역시"
								${search.searchSidoValue eq '광주광역시' ? 'selected="selected"' : '' }>광주광역시</option>
							<option value="대구광역시"
								${search.searchSidoValue eq '대구광역시' ? 'selected="selected"' : '' }>대구광역시</option>
							<option value="울산광역시"
								${search.searchSidoValue eq '울산광역시' ? 'selected="selected"' : '' }>울산광역시</option>
							<option value="부산광역시"
								${search.searchSidoValue eq '부산광역시' ? 'selected="selected"' : '' }>부산광역시</option>
							<option value="경기도"
								${search.searchSidoValue eq '경기도' ? 'selected="selected"' : '' }>경기도</option>
							<option value="강원도"
								${search.searchSidoValue eq '강원도' ? 'selected="selected"' : '' }>강원도</option>
							<option value="충청북도"
								${search.searchSidoValue eq '충청북도' ? 'selected="selected"' : '' }>충청북도</option>
							<option value="충청남도"
								${search.searchSidoValue eq '충청남도' ? 'selected="selected"' : '' }>충청남도</option>
							<option value="전라북도"
								${search.searchSidoValue eq '전라북도' ? 'selected="selected"' : '' }>전라북도</option>
							<option value="전라남도"
								${search.searchSidoValue eq '전라남도' ? 'selected="selected"' : '' }>전라남도</option>
							<option value="경상북도"
								${search.searchSidoValue eq '경상북도' ? 'selected="selected"' : '' }>경상북도</option>
							<option value="경상남도"
								${search.searchSidoValue eq '경상남도' ? 'selected="selected"' : '' }>경상남도</option>
							<option value="제주도"
								${search.searchSidoValue eq '제주도' ? 'selected="selected"' : '' }>제주도</option>
						</select>
					</div>
				</div>
				<!-- 제목 검색 -->
				<div class="row col-12 p-0">
					<div class="col-12 my-2">
						<div class="input-group">
							<input type="text" class="form-control" id="searchTitle"
								name="searchTitle" placeholder="검색어 입력"
								value="${ search.searchTitle }" aria-label="Input group example"
								aria-describedby="basic-addon1">
							<button id="titleBtn" type="button" class="btn btn-classic">
								<i class="bi bi-search"></i>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 정렬 -->
		<div class="d-grid d-md-flex justify-content-md-end">
			<div class="w-25 d-grid d-md-flex justify-content-md-end">
				<!-- 모집 여부 -->
				<div class="form-check mozip-m">
					<input class="form-check-input" type="checkbox" id="reverseCheck"
						name="searchMozipCheck"
						${ search.searchMozipCheck == 'on' ? 'checked="checked"' : ''}>
					<label class="form-check-label" for="reverseCheck"
						id="checkRecruitmentIng"> 모집중 </label>
				</div>
				<select name="searchSortBy" class="form-select w-50">
					<option value="recent"
						${ search.searchSortBy eq 'recent' ? 'selected="selected"' : '' }>최신순</option>
					<option value="popularity"
						${search.searchSortBy eq 'popularity' ? 'selected="selected"' : '' }>인기순</option>
				</select>
			</div>
		</div>
	</form>


	<!--아이템: model.addAttribute("listCount", dto);-->
	<c:choose>
		<c:when test="${ empty listCount }">
			<div class="d-flex" id="emptyListCount">
				<h3 class="text-lg text-center">현재 모집중인 모임이 존재하지 않습니다.</h3>
			</div>
		</c:when>
		<c:otherwise>
			<div id="cardList" class="album mt-5">
				<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
					<!-- for문 변경가능함 확인해보기. 
		      -> 로그인: header.jsp, main.jsp => 37줄 참고 
		      -> https://baessi.tistory.com/144: 아이디 각 카드마다 다르게 해야 함.
		    -->
					<c:forEach items="${listCount}" var="cardList" varStatus="status">
						<c:choose>
							<c:when test="${ listCount == null }">
								<div class="p-2 m-3 text-center">"현재 모집중인 모임이 존재하지 않습니다."</div>
							</c:when>
							<c:otherwise>
								<c:url var="meetDetailPage" value="/meet/maindetail">
									<c:param name="mtid" value="${cardList.mtid}" />
								</c:url>
								<div class="col" style="cursor: pointer;" id="clickEvent"
									onclick="location=href=('${meetDetailPage}');">
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
											<sec:authentication property="principal.username"
												var="loginUser" />
											<input class="d-none" id="mtid" value="${ cardList.mtid }" />
											<input class="d-none" id="id" value="${loginUser}" />
											<c:set var="author" value="${ cardList.CRTR_ID }" />
											<c:forEach items="${like}" var="like">
												<c:choose>
													<c:when
														test="${ loginUser == like.id && cardList.mtid == like.mtid && author != loginUser}">
														<img src="../static/images/sample/like.svg"
															alt="toggle-off" width="40"
															class="heart overlay-image overlay-right" id="img-heart"
															onclick="event.stopPropagation(); LogInLikeCheck();" />
													</c:when>
													<c:when
														test="${ loginUser == like.id && cardList.mtid == like.mtid && author == loginUser}">
														<img src="../static/images/sample/like2.svg"
															alt="toggle-off" width="40"
															class="heart overlay-image overlay-right" id="img-heart"
															onclick="event.stopPropagation(); alert('선택하신 모임을 작성한 사용자는 찜을 할 수 없습니다.');" />
													</c:when>
													<c:otherwise>
														<img src="../static/images/sample/like2.svg"
															alt="toggle-off" width="40"
															class="heart overlay-image overlay-right"
															id="img-heartEmpty"
															onclick="event.stopPropagation(); LogLikeUnCheck();" />
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</sec:authorize>
										<!-- 로그인 안 함 -->
										<sec:authorize access="isAnonymous()">
											<img src="../static/images/sample/like2.svg" alt="not-move"
												width="40" class="heart overlay-image overlay-right"
												onclick="event.stopPropagation(); alert('로그인 후 찜 가능합니다');" />
										</sec:authorize>
										<div>
											<c:choose>
												<c:when test="${cardList.PCNT >= cardList.nm_ppl}">
													<div id="mozipFin${status.begin}">
														<img id="mozipFinImg${status.begin}"
															src="../static/images/sample/mozip_fin.svg"
															alt="recuriEng" width="80"
															class="overlay-image overlay-left" />
													</div>
												</c:when>
												<c:otherwise>
													<div id="mozipIin${status.begin}">
														<img id="mozipIin${status.begin}"
															src="../static/images/sample/mozip_ing.svg"
															alt="recuriIng" width="80"
															class="overlay-image overlay-left" />
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
														<svg xmlns="http://www.w3.org/2000/svg" width="16"
															height="16" fill="currentColor"
															class="bi bi-suit-heart-fill" viewBox="0 0 16 16">
	                     						 <path
																d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z" />
	                   						</svg>
														<span class="text-end" id="heart${status.begin}"> <em>${cardList.LCNT}</em>
														</span>
													</div>
												</div>
												<br>
												<div class="titleHidden"
													id="post-sidoAndTitle${status.begin}">[
													${cardList.sido} ] &lt;${cardList.title}&gt;</div>

												<div id="post-mtDate${status.begin}">
													<span class="map">모임일정: ${cardList.mt_date}</span>
												</div>
											</div>
											<div class="text-lg-end text-center">
												<small class="text-muted"> 모집인원: <span
													id="currentApplicants${status.begin}">${cardList.PCNT}</span>
													/ <span id="maxApplicants${status.begin}">${cardList.nm_ppl}</span>
												</small>
											</div>
										</div>
										<!-- card body -->
									</div>
								</div>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</div>
			</div>
		</c:otherwise>
	</c:choose>

	<!-- 페이징 -->
	<!-- 페이징 -->
	<div class="mt-3 pt-3">
		<nav>
			<ul class="pagination justify-content-center">
				<li class="page-item ${ paging.prev ? '' : 'disabled' }"><a
					class="page-link" href="${ paging.startPage -1 }" tabindex="-1">Previous</a>
				</li>
				<c:forEach begin="${ paging.startPage }" end="${ paging.endPage }"
					var="num">
					<li class="page-item ${ paging.cri.pageNum == num? "active":"" }">
						<a class="page-link" href="${ num }">${ num }</a>
					</li>
				</c:forEach>
				<li class="page-item ${ paging.next? '' : 'disabled' }"><a
					class="page-link" href="${ paging.endPage +1 }" tabindex="-1">Next</a>
				</li>
			</ul>
		</nav>
	</div>
</div>

<script src="<%=request.getContextPath()%>/static/js/meet-list.js"></script>
<%@ include file="../common/footer.jsp"%>