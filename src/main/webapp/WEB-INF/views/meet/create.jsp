<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../common/header.jsp"%>
	<div class="container">
		<div class="my-5 p-2">
			<div class="border bg-body rounded shadow-sm meetCreateBox">
				<!-- 작성 -->
				<div>
					<div class="meetCreateTitle">
						<h1 class="titleBolder">모임 등록</h1>
					</div>
					<div class="meetCreateInfo">
						<div align="right" id="mt_notice">
						<small> 필수 입력 
						<strong>*</strong> 
						<br> 
						모임 분야, 모임 장소,
						모집 기간, 모임 인원은 수정할 수 없습니다.
						</small>
						</div>
					</div>
					<form action="" method="post" class="form-box" id="createForm">
						<dl>
							<div>
								<sec:authorize access="isAuthenticated()">
									<input type="hidden" id="crtr_id" name="crtr_id"
										value="<sec:authentication property="principal.username"/>" />
								</sec:authorize>
							</div>
							<dt align="left" class="dt_class">
								모임 제목 <span class="highlight">*</span>
							</dt>
							<dd align="left">
							  <div class="input-group">
							    <input type="text" id="title" name="title" class="form-control" placeholder="모임의 제목을 입력하세요." oninput="updateCharCount()" autofocus required>
							  </div>
							  <div class="smallText">
							    <small id="textLengthCheck" class="form-text text-muted">(0 / 80)</small>
							  </div>
							</dd>
							<br>
							<dt align="left" class="dt_class">
								모임 분류 <span class="highlight">*</span>
							</dt>
							<dd align="left">
								<div class="input-group mb-3">
									<select class="form-select" aria-label="Default select example" id="category" name="category" required>
										<option value="" selected>카테고리를 선택하세요.</option>
										<option value="운동·액티비티">운동·액티비티</option>
										<option value="음식·음료">음식·음료</option>
										<option value="취미">취미</option>
										<option value="여행·동행">여행·동행</option>
										<option value="자기계발·교육">자기계발·교육</option>
										<option value="동네·친목">동네·친목</option>
										<option value="문화·예술">문화·예술</option>
										<option value="기타">기타</option>
									</select>
								</div>
							</dd>
							<br>
							<dt align="left" class="dt_class">
								모임 장소 
								<span class="highlight">*</span>
							</dt>
							<dd align="left">
								<div>
									<div class="input-group mb-3">
										<select class="form-select" name="sido" id="sido"></select> 
										<select class="form-select" name="sigungu" id="sigungu"></select>
									</div>
								</div>
								<div class="input-group mb-3">
									<input type="text" id="location" name="location" class="form-control" placeholder="상세주소 및 장소명을 입력해주세요." required>
								</div>
							</dd>
							<br>
							<dt id="mt_schedule" align="left" class="dt_class">
								모임 일정 <span class="highlight">*</span>
							</dt>
							<dd id="mt_schedule_detail" align="left">
								<div>
									<div class="input-group mb-3">
										<input type="date" id="mt_date"
											name="mt_date" class="form-control" placeholder="날짜" required>
										<input type="time" id="mt_time"
											name="mt_time" class="form-control" placeholder="시간" required>
									</div>
								</div>
							</dd>
							<br>
							<dt id="rcrt_prd" align="left" class="dt_class">
								모집 기간 <span class="highlight">*</span>
							</dt>
							<dd id="rcrt_prd_detail" align="left">
								<div>
									<div class="input-group mb-3">
										<input type="date" id="str_date" name="str_date" class="form-control"
											placeholder="시작날짜" readonly />
										<input type="date" id="ed_date" name="ed_date" class="form-control"
											placeholder="종료날짜" required />
									</div>
								</div>
							</dd>
							<br>
							<dt align="left" class="dt_class">
								모임 인원 <span class="highlight">*</span>
							</dt>
							<dd align="left">
								<div class="smallText">
									<div class="input-group">
										<input type="number" class="form-control" id="nm_ppl"
										placeholder="인원 수를 입력하세요." aria-label="인원 수를 입력하세요." aria-describedby="ppl" required /> 
										<span class="input-group-text" id="ppl">명</span>
									</div>
									<small id="nm_ppl_help" class="form-text text-muted">숫자만 입력</small>
								</div>
							</dd>
							<br>
							<dt id="mt_cost" align="left" class="dt_class">
							참가비용(원)
							</dt>
							<dd id="mt_cost_detail" align="left">
								<div class="input-group">
									<input type="text" id="mt_cost" name="mt_cost" class="form-control"  placeholder="참가비 없음." aria-describedby="mt_cost" readonly />
									<span class="input-group-text" id="mt_cost">원</span>
										<select id="mt_cost_info" name="mt_cost_info" class="form-select" onchange="resetInputValue()">
											<option value="참가비 없음.">---참가비 없음---</option>
											<option value="다과비">다과비</option>
											<option value="재료비">재료비</option>
											<option value="대관료">대관료</option>
											<option value="운영비">운영비</option>
											<option value="노쇼방지">노쇼방지</option>
											<option value="기타">기타</option>
										</select> 
								</div>
								<div class="smallText">
									<small id="nm_ppl_help" class="form-text text-muted">숫자만 입력 예) 5000</small>
								</div>
							</dd>
							<br>
							<dt align="left" class="dt_class">
							모임 사진
							</dt>
							<dd align="left">
								<div>
									<div class="mb-3">
										<input class="form-control" type="file" id="formFile" accept="image/*">
									</div>
									<div class="mb-3">
										<input class="form-control" type="file" id="formFile" accept="image/*">
									</div>
									<div class="mb-3">
										<input class="form-control" type="file" id="formFile" accept="image/*">
									</div>
									<div class="mb-3">
										<input class="form-control" type="file" id="formFile" accept="image/*">
									</div>
									<div class="mb-3">
										<input class="form-control" type="file" id="formFile" accept="image/*">
									</div>
								</div>
							</dd>
							<br>
							<dt align="left" class="dt_class">
							모임 상세 내용
							</dt>
							<dd align="left">
								<div>
									<div class="my-2">
										<!-- DB에 들어갈 때 p태그가 생기는 문제 -->
										<textarea class="form-control" id="summernote" name="content" placeholder="모임을 소개해주세요."></textarea>
									</div>
								</div>
							</dd>
						</dl>
						<div>
							<div>
								<div class="my-2 text-center">
									<a class="mx-3 btn btn-secondary" id="btnCancel">취소</a>
									
									<input class="mx-3 btn btn-classic" type="submit"
										id="btnCreate" value="모임등록" />
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
		integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
		crossorigin="anonymous"></script>
	<link
		href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
		rel="stylesheet">
	<script
		src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
	<script src="../static/summernote/lang/summernote-ko-KR.js"></script>
	<script src="<%=request.getContextPath()%>/static/js/meet-create.js"></script>
	<script src="<%=request.getContextPath()%>/static/js/meet-summernote.js"></script>
<%@ include file="../common/footer.jsp"%>