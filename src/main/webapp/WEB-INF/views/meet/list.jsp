<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	

<%@ include file="../common/header.jsp"%>
 <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, 그리고 Bootstrap 기여자들">
    <meta name="generator" content="Hugo 0.88.1">
    <title>Album example · Bootstrap v5.1</title>

    <link rel="canonical" href="https://getbootstrap.kr/docs/5.1/examples/album/">

    

    <!-- Bootstrap core CSS -->
<link href="/docs/5.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <!-- Favicons -->
<link rel="apple-touch-icon" href="/docs/5.1/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.1/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/5.1/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#7952b3">


    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>

    
  </head>

<body>
	<!--검색/필터-->
	<div class="tst-tools">
		<form id="search_form"
			action="https://www.plomeet.com/meetings/single/search"
			class="searchForm" method="post">
			<input type="hidden" name="_token"
				value="ETZkFaodePka6Rzd4LOdkxx5G5AbBDX4aS7jJNFK">
			<div class="tst-title">어떤 모임을 찾으세요?</div>
			<div class="tst-search">
				<div class="sch-wrap">
					<label for="search_term"> <input type="text"
						id="search_term" name="search_term" class="input-sch"
						placeholder="검색어 입력">
					</label>
					<button type="submit" class="btn-sch">
						<i class="material-icons">search</i>
					</button>
					<button type="button" class="btn-reset">
						<i class="material-icons">cancel</i>
					</button>
				</div>
			</div>
			<div class="tst-filter">
				<div class="left-box">
					<div class="total-wrap"></div>
				</div>
				<div class="right-box">
					<div class="sort-wrap">
						<select name="sort_by" onchange="submit()">
							<option value="latest">최신순</option>
							<option value="popular">인기순</option>
						</select>
					</div>
					<!-- 필터 -->
					<div class="filter-wrap">
						<button type="button" class="btn-filter"
							onclick="modalCtrl.openFilterPop();">
							<i class="material-icons">sort</i> <span>필터</span>
						</button>
					</div>
					<!--[D] modal 상세조건 -->
					<div id="modalFilter" class="modal fade">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true"> <i class="material-icons">close</i>
										</span>
									</button>
									<h4 class="modal-title">상세조건설정</h4>
								</div>
								<div class="modal-body">
									<div class="filterForm">
										<dl class="create-form">
											<dt>지역 및 장소</dt>
											<dd>
												<div class="flex-col">
													<div class="col">
														<label for="city"> <select id="city"
															name="city_id" class="select-default">
																<option value="">---시/도 선택---</option>
																<option value="1">전체</option>
																<option value="2">서울</option>
																<option value="3">부산</option>
																<option value="4">대구</option>
																<option value="5">인천</option>
																<option value="6">광주</option>
																<option value="7">대전</option>
																<option value="8">울산</option>
																<option value="9">세종</option>
																<option value="10">경기</option>
																<option value="11">경남</option>
																<option value="12">경북</option>
																<option value="13">충남</option>
																<option value="14">충북</option>
																<option value="15">전남</option>
																<option value="16">전북</option>
																<option value="17">강원</option>
																<option value="18">제주</option>
														</select>
														</label>
													</div>
													<div class="col">
														<label for="town"> <select id="town"
															name="town_id" class="select-default">
																<option value="">---구/군 선택---</option>
														</select>
														</label>
													</div>
												</div>
											</dd>
											<dt>모임 주제(카테고리)</dt>
											<dd>
												<div class="col check-default"
													style="width: 33.3333%; float: left;">
													<label for="category_id1"> <input type="checkbox"
														name="category_id[]" id="category_id1" value="1">
														<span>교육·언어·도서</span>
													</label>
												</div>
												<div class="col check-default"
													style="width: 33.3333%; float: left;">
													<label for="category_id2"> <input type="checkbox"
														name="category_id[]" id="category_id2" value="2">
														<span>아웃도어·여행</span>
													</label>
												</div>
												<div class="col check-default"
													style="width: 33.3333%; float: left;">
													<label for="category_id3"> <input type="checkbox"
														name="category_id[]" id="category_id3" value="3">
														<span>유아·아동</span>
													</label>
												</div>
												<div class="col check-default"
													style="width: 33.3333%; float: left;">
													<label for="category_id4"> <input type="checkbox"
														name="category_id[]" id="category_id4" value="4">
														<span>운동·액티비티</span>
													</label>
												</div>
												<div class="col check-default"
													style="width: 33.3333%; float: left;">
													<label for="category_id5"> <input type="checkbox"
														name="category_id[]" id="category_id5" value="5">
														<span>요리·공예·제조</span>
													</label>
												</div>
												<div class="col check-default"
													style="width: 33.3333%; float: left;">
													<label for="category_id6"> <input type="checkbox"
														name="category_id[]" id="category_id6" value="6">
														<span>문화·공연·축제</span>
													</label>
												</div>
												<div class="col check-default"
													style="width: 33.3333%; float: left;">
													<label for="category_id7"> <input type="checkbox"
														name="category_id[]" id="category_id7" value="7">
														<span>사진·영상·음악</span>
													</label>
												</div>
												<div class="col check-default"
													style="width: 33.3333%; float: left;">
													<label for="category_id8"> <input type="checkbox"
														name="category_id[]" id="category_id8" value="8">
														<span>게임·오락</span>
													</label>
												</div>
												<div class="col check-default"
													style="width: 33.3333%; float: left;">
													<label for="category_id9"> <input type="checkbox"
														name="category_id[]" id="category_id9" value="9">
														<span>자동차·오토바이</span>
													</label>
												</div>
												<div class="col check-default"
													style="width: 33.3333%; float: left;">
													<label for="category_id10"> <input type="checkbox"
														name="category_id[]" id="category_id10" value="10">
														<span>패션·뷰티</span>
													</label>
												</div>
												<div class="col check-default"
													style="width: 33.3333%; float: left;">
													<label for="category_id11"> <input type="checkbox"
														name="category_id[]" id="category_id11" value="11">
														<span>친목·사교·미팅</span>
													</label>
												</div>
												<div class="col check-default"
													style="width: 33.3333%; float: left;">
													<label for="category_id12"> <input type="checkbox"
														name="category_id[]" id="category_id12" value="12">
														<span>업무·직종</span>
													</label>
												</div>
												<div class="col check-default"
													style="width: 33.3333%; float: left;">
													<label for="category_id13"> <input type="checkbox"
														name="category_id[]" id="category_id13" value="13">
														<span>봉사·단체활동</span>
													</label>
												</div>
												<div class="col check-default"
													style="width: 33.3333%; float: left;">
													<label for="category_id14"> <input type="checkbox"
														name="category_id[]" id="category_id14" value="14">
														<span>자유주제</span>
													</label>
												</div>
											</dd>
											<dt>모임 일정</dt>
											<dd>
												<div class="flex-col">
													<div class="col">
														<label for="start_date" class="_date_po"> <i
															class="material-icons _date_ic">event_available</i> <input
															type="text" id="start_date" name="start_date"
															class="input-date" placeholder="시작일">
														</label>
													</div>
													<div class="col">
														<label for="end_date" class="_date_po"> <i
															class="material-icons _date_ic">event_available</i> <input
															type="text" id="end_date" name="end_date"
															class="input-date" placeholder="종료일">
														</label>
													</div>
												</div>
											</dd>
											<dt>모임 인원(명)</dt>
											<dd>
												<div class="flex-col">
													<div class="col">
														<label for="headcount_min"> <input type="number"
															id="headcount_min" name="headcount_min"
															class="input-default" placeholder="최소 (숫자입력)">
														</label>
													</div>
													<div class="col">
														<label for="headcount_max"> <input type="number"
															id="headcount_max" name="headcount_max"
															class="input-default" placeholder="최대 (숫자입력)">
														</label>
													</div>
												</div>
											</dd>
											<dt>연령</dt>
											<dd>
												<div class="flex-col">
													<div class="col">
														<label for="age_min"> <input type="number"
															id="age_min" name="age_min" class="input-default"
															placeholder="최소 (숫자입력)">
														</label>
													</div>
													<div class="col">
														<label for="age_max"> <input type="number"
															id="age_max" name="age_max" class="input-default"
															placeholder="최대 (숫자입력)">
														</label>
													</div>
												</div>
											</dd>
											<dt>참가비용(원)</dt>
											<dd>
												<div class="flex-col">
													<div class="col">
														<label for="fee_min"> <input type="number"
															id="fee_min" name="fee_min" class="input-default"
															placeholder="최소 (숫자입력)">
														</label>
													</div>
													<div class="col">
														<label for="fee_max"> <input type="number"
															id="fee_max" name="fee_max" class="input-default"
															placeholder="최소 (숫자입력)">
														</label>
													</div>
												</div>
											</dd>
										</dl>
									</div>
								</div>
								<div class="modal-footer">
									<div class="flex-col">
										<div class="col">
											<button type="submit" class="btn-lg-primary">필터 적용</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="card-type-a">
						<button type="button" class="btn-card">
							<i class="material-icons type-a"
								onclick="utilsCtrl.changeCardTypeA();">border_all</i> <i
								class="material-icons type-b on"
								onclick="utilsCtrl.changeCardTypeB();">format_list_bulleted</i>
						</button>
					</div>
				</div>
			</div>
		</form>
	</div>
	<!--아이템: 부트 스트랩 사용. model.addAttribute("listCount", dto);-->
	<div class="album py-5 bg-light">
    <div class="container">

      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
      			<c:forEach items="${ listCount }" var="cardList">
				<div class="col">
					<div class="card shadow-sm">
						<svg class="bd-placeholder-img card-img-top" width="100%"
							height="225" xmlns="http://www.w3.org/2000/svg" role="img"
							aria-label="Placeholder: Thumbnail"
							preserveAspectRatio="xMidYMid slice" focusable="false">
							<title>Placeholder</title><rect width="100%" height="100%"
								fill="#55595c" />
							<text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>

						<div class="card-body">
							<p class="card-text">This is a wider card with supporting
								text below as a natural lead-in to additional content. This
								content is a little bit longer.</p>
							<div class="d-flex justify-content-between align-items-center">
								<!-- 삭제해야 함. btn -->
								<div class="btn-group">
									<button type="button" class="btn btn-sm btn-outline-secondary">View</button>
									<button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
								</div>
								<small class="text-muted">9 mins</small>
							</div>
						</div>
					</div>
				</div>
				</c:forEach>
			</div>
        </div>
        </div>


	<script src="/docs/5.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>

<%@ include file="../common/footer.jsp"%>