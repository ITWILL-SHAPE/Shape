<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ include file="../common/header.jsp"%>
<head>
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

<!-- css -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/static/css/style.css" />
</head>

<div class="container-fluid container">

	<!--제목 검색 -> post -->
	<header class="d-grid my-2 col-7 mx-auto m-5 text-center">
		<h1>전체 모임</h1>
		<div class="tst-tools">
			<div class="d-flex justify-content-center">
				<div class="input-group w-50">
					<form id="searchFormByTitle" class="TitleSearchForm">
						<input type="text" class="form-control" id="searchTitle"
							name="serchT" placeholder="검색어 입력"
							aria-label="Input group example" aria-describedby="basic-addon1">
					</form>
					<button id="titleBtn" type="button"
						class="btn btn-outline-secondary">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                            <path
								d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
                        </svg>
						<span class="visually-hidden">Button</span>
					</button>
				</div>
			</div>
		</div>
	</header>

	<!--모집 중 체크 박스 검색 -> post + label과 input의 순서 중요 서로 앞뒤로 바뀌면 js가 실행이 안됨.-->
	<form id="searchFormCheckBox" class="CheckBoxSearchForm">
		<div class="form-check form-check-reverse">
			 <label class="form-check-label"
				for="reverseCheck" id="checkRecruitmentStatus"> 모집중 </label>
			<input class="form-check-input" type="checkbox" value=""
				id="reverseCheck">	
		</div>
	</form>

	<!-- category/sido/ 검색 div들 -> post -->

	<div class="d-flex mb-3">
		<!-- 모집 분야 필터 -->
		<div class="p-2">
			<form id="searchFormCategory" class="categorySearchForm">
				<div class="input-group mb-3">
					<label for="categorySelect"> <select
						class="custom-select custom-select-lg mb-3" id="category"
						name="category">
							<option value="">모집 분야</option>
							<option value="1">운동·액티비티</option>
							<option value="2">음식·음료</option>
							<option value="3">취미</option>
							<option value="4">여행·동행</option>
							<option value="5">자기계발·교육</option>
							<option value="6">동네·친목</option>
							<option value="7">문화·예술</option>
							<option value="8">기타</option>
					</select>
					</label>
				</div>
			</form>
		</div>

		<!-- 시도 필터 -->

		<div class="p-2">
			<form id="searchFormSido" class="sidoSearchForm">
				<div class="input-group mb-3">
					<label for="sidoSelect"> <select
						class="custom-select custom-select-lg mb-3" id="sido"
						name="sidoValue">
							<option value="">---시/도 선택---</option>
							<option value="1">서울특별시</option>
							<option value="2">인천광역시</option>
							<option value="3">대전광역시</option>
							<option value="4">광주광역시</option>
							<option value="5">대구광역시</option>
							<option value="6">울산광역시</option>
							<option value="7">부산광역시</option>
							<option value="8">경기도</option>
							<option value="9">강원도</option>
							<option value="10">충청북도</option>
							<option value="11">충청남도</option>
							<option value="12">전라북도</option>
							<option value="13">전라남도</option>
							<option value="14">경상북도</option>
							<option value="15">경상남도</option>
							<option value="16">제주도</option>
					</select>
					</label>
				</div>
			</form>
		</div>
		<div class="ms-auto p-2">
			<form id="searchFormSort" class="sortSearchForm">
				<!-- <select> 요소의 선택 항목을 변경했을 때 발생하는 이벤트를 처리하는 JavaScript 코드를 지정 -->
				<select name="sortBy" onchange="submit()">
					<option value="latest">최신순</option>
					<option value="popular">인기순</option>
				</select>
			</form>
		</div>
	</div>
	<!--아이템: model.addAttribute("listCount", dto);-->
<div id="cardList" class="album py-5">
  <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
    <!-- for문 변경가능함 확인해보기. 
      -> 로그인: header.jsp, main.jsp => 37줄 참고 
      -> https://baessi.tistory.com/144: 아이디 각 카드마다 다르게 해야 함.
    -->
    <c:forEach items="${listCount}" var="cardList" varStatus="status">
      <c:url var="meetDetailPage" value="/meet/maindetail">
        <c:param name="mtid" value="${cardList.mtid}" />
      </c:url>
      <div class="col">
        <div class="card shadow-sm image-container position-relative">
          <a id="meetListATag" href="${meetDetailPage}" class="text-decoration-none" >
            <svg idx="${status.begin}" class="bd-placeholder-img card-img-top" width="100%" height="220"
              xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail"
              preserveAspectRatio="xMidYMid slice" focusable="false">
              <rect width="100%" height="100%" fill="#55595c" />
            </svg>
            <div>
              <a idx="${status.begin}" href="javascript:" class="heart-click heart_icon${status.begin}">
                <img src="../static/images/sample/like2.svg" alt="toggle-off" width="50"
                  class="heart overlay-image overlay-right" />
              </a>
            </div>
 			
 			<div>      
            <c:choose>
            	<c:when test="${cardList.pcnt >= cardList.nm_ppl}">
	                 <div id="mozipFin${status.begin}">
		              <img id="mozipFinImg${status.begin}" src="../static/images/sample/mozip_fin.svg" alt="recuriEng"
		                width="80" class="overlay-image overlay-left" />
		            </div>
            	</c:when>
            	<c:otherwise>
		            <div id="mozipIin${status.begin}">
	              	   <img id="mozipIin${status.begin}" src="../static/images/sample/mozip_ing.svg" alt="recuriIng"
	                		width="80" class="overlay-image overlay-left" />
	               </div>
            	</c:otherwise>
            </c:choose>
            </div>

            <%-- 로그인 상태에 따른 하트 클릭 가능 여부 처리 -> 살려두면 후에 로그인 시 카드 화면이 안보임 카드 전체적으로 묶어야 하는 것 같음
            <script>
              <sec:authorize access="isAuthenticated()">
                var id = '${cardList.id}'; // 사용자 ID
                var author = '${cardList.author}'; // 카드의 작성자 ID

                // 로그인한 사용자와 카드의 작성자가 일치하는 경우
                if (id === author) {
                  // 클릭 가능한 하트로 설정
                  document.querySelector('.heart_icon${status.begin}').addEventListener('click', function(e) {
                   e.default
                  });
                }
              </sec:authorize>

              <sec:authorize access="isAnonymous()">
                // 로그인하지 않은 사용자일 경우
                document.querySelector('.heart_icon${status.begin}').addEventListener('click', function() {
                  alert('로그인이 필요합니다.');
                });
              </sec:authorize>
            </script>  --%>
			
            <div class="card-body">
              <div class="post-inner">
                <div class="row align-items-center">
                  <div class="col-auto" id="post-category${status.begin}">
                    ${cardList.category}
                  </div>
                  <div class="col text-lg-end text-center">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                      class="bi bi-suit-heart-fill" viewBox="0 0 16 16">
                      <path
                        d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z" />
                    </svg>
                    <span class="text-end" id="heart${status.begin}">
                      <em>${cardList.lcnt}</em>
                    </span>
                  </div>
                </div>
                <div id="post-sidoAndTitle${status.begin}">
                  [ ${cardList.sido} ] &lt;${cardList.title}&gt;
                </div>
                <div id="post-mtDate${status.begin}">
                  <span class="map">모집일정: ${cardList.mt_date}</span>
                </div>
              </div>
              <div class="text-lg-end text-center">
                <small class="text-muted">
                  모집인원:
                  <span id="currentApplicants${status.begin}">${cardList.pcnt}</span>
                  / <span id="maxApplicants${status.begin}">${cardList.nm_ppl}</span>
                </small>
              </div>
            </div> <!-- card body -->
           </a>
         </div>
      </div>
    </c:forEach>
  </div>
</div>

</div>
</div>
<div class="my-2 p-5 d-grid gap-2 col-6 mx-auto">
	<button id="loadMoreBtn" class="btn btn-outline-success btn-lg"
		type="button">더보기</button>
</div>


<script src="<%=request.getContextPath()%>/static/js/meet-list.js"></script>
<%@ include file="../common/footer.jsp"%>