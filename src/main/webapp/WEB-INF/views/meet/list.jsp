<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../common/header.jsp"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Shape</title>
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
	<!--아이템: 부트 스트랩 사용.-->
	<div class="item-box">
		<div class="lst-board">
			<ul>
				<li><a href="https://www.plomeet.com/meetings/13/_show">
						<div class="post-img">
							<div class="pst-target"
								style="background: url('https://www.plomeet.com/images/plomeet/category/1658588859.png')"></div>
						</div>
						<div class="post-inner">
							<div class="post-location">
								<span class="head">서울 관악구</span>
							</div>
							<div class="post-tit tit-lg">도림천 같이 산책 가요~</div>
							<div class="post-info">
								<span class="map">친목·사교·미팅</span> <span class="member"> <em>3
										~ 10</em> 명
								</span>
							</div>
							<div class="post-status">
								<button type="button" class="btn--sm">모임종료</button>
							</div>
						</div>
				</a></li>
				<li><a href="https://www.plomeet.com/meetings/10/_show">
						<div class="post-img">
							<div class="pst-target"
								style="background: url('https://www.plomeet.com/images/plomeet/category/1658588829.png')"></div>
						</div>
						<div class="post-inner">
							<div class="post-location">
								<span class="head">경기 성남시 수정구</span>
							</div>
							<div class="post-tit tit-lg">커피 고고~</div>
							<div class="post-info">
								<span class="map">게임·오락</span> <span class="member"> <em>인원
										제한없음</em>
								</span>
							</div>
							<div class="post-status">
								<button type="button" class="btn--sm _apply">모집중</button>
							</div>
						</div>
				</a></li>
				<li><a href="https://www.plomeet.com/meetings/9/_show">
						<div class="post-img">
							<div class="pst-target"
								style="background: url('https://www.plomeet.com/images/plomeet/category/1658588891.png')"></div>
						</div>
						<div class="post-inner">
							<div class="post-location">
								<span class="head">인천 계양구</span>
							</div>
							<div class="post-tit tit-lg">한강 갈분 구함 2</div>
							<div class="post-info">
								<span class="map">자유주제</span> <span class="member"> <em>2
										~ 5</em> 명
								</span>
							</div>
							<div class="post-status">
								<button type="button" class="btn--sm">모임종료</button>
							</div>
						</div>
				</a></li>
				<li><a href="https://www.plomeet.com/meetings/6/_show">
						<div class="post-img">
							<div class="pst-target"
								style="background: url('https://www.plomeet.com/images/plomeet/category/1658588768.png')"></div>
						</div>
						<div class="post-inner">
							<div class="post-location">
								<span class="head">제주 전체</span>
							</div>
							<div class="post-tit tit-lg">제주도 서핑 고고~~</div>
							<div class="post-info">
								<span class="map">운동·액티비티</span> <span class="member"> <em>인원
										제한없음</em>
								</span>
							</div>
							<div class="post-status">
								<button type="button" class="btn--sm">모임종료</button>
							</div>
						</div>
				</a></li>
				<li><a href="https://www.plomeet.com/meetings/2/_show">
						<div class="post-img">
							<div class="pst-target"
								style="background: url('https://www.plomeet.com/images/plomeet/category/1658588726.png')"></div>
						</div>
						<div class="post-inner">
							<div class="post-location">
								<span class="head">경기 전체</span>
							</div>
							<div class="post-tit tit-lg">[서울 경기] 주말에 노지캠핑 가요~</div>
							<div class="post-info">
								<span class="map">아웃도어·여행</span> <span class="member"> <em>2
										~ 3</em> 명
								</span>
							</div>
							<div class="post-status">
								<button type="button" class="btn--sm">모임종료</button>
							</div>
						</div>
				</a></li>
				<li><a href="https://www.plomeet.com/meetings/1/_show">
						<div class="post-img">
							<div class="pst-target"
								style="background: url('https://www.plomeet.com/images/plomeet/category/1658588859.png')"></div>
						</div>
						<div class="post-inner">
							<div class="post-location">
								<span class="head">서울 강남구</span>
							</div>
							<div class="post-tit tit-lg">비도 오는데 모듬전에 막걸리 한주전자 콜~??</div>
							<div class="post-info">
								<span class="map">친목·사교·미팅</span> <span class="member"> <em>3
										~ 6</em> 명
								</span>
							</div>
							<div class="post-status">
								<button type="button" class="btn--sm">모임종료</button>
							</div>
						</div>
				</a></li>
			</ul>
		</div>
	</div>
	</div>
	</div>
	</div>
	
</body>
</html>
<%@ include file="../common/footer.jsp"%>