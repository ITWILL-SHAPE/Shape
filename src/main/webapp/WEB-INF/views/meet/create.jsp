<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Shape</title>
</head>
<body>
	<div class="container">
		<div class="container">
		 	<div class="text-center border bg-body rounded shadow-sm meetCreateBox">
				<!-- 작성 -->
				<div class="back-wrap">
					<div class="back-inner">
						<div>
							<h2 class="my-4">모임 만들기</h2>
							<div class="my-2" align="right" id="mt_notice">
								<small>
								필수 입력
								<strong>*</strong>
								<br>
								모임 분야, 모임 장소, 모집 기간, 모임 인원은 수정할 수 없습니다.
								</small>
							</div>
							<form action="" method="post" class="form-box" id="createForm">
								<dl>
									<div>
										<sec:authorize access="isAuthenticated()">
											<input type="hidden" id="crtr_id" name="crtr_id" value="<sec:authentication property="principal.username"/>" />
										</sec:authorize>
									</div>
									<dt align="left">
									모임 제목
										<span>*</span>
									</dt>
									<dd align="left">
										<div>
											<label for="title" class="form-label">
												<input type="text" id="title" name="title" class="form-control"
												placeholder="모임의 제목을 입력하세요." value required>
											</label>	
										</div>
									</dd>	
									<dt align="left">
									모임 분류
										<span>*</span>
									</dt>
									<dd align="left">
										<div class="input-group mb-3">
											<label for="categorySelect">
												<select class="custom-select custom-select-lg mb-3" id="category" name="category">
													<option>카테고리를 선택하세요.</option>
													<option value="운동·액티비티">운동·액티비티</option>
													<option value="음식·음료">음식·음료</option>
													<option value="취미">취미</option>
													<option value="여행·동행">여행·동행</option>
													<option value="자기계발·교육">자기계발·교육</option>
													<option value="동네·친목">동네·친목</option>
													<option value="문화·예술">문화·예술</option>
													<option value="기타">기타</option>
												</select>
											</label>
										</div>
									</dd>
									<dt align="left">
									모임 장소
									<span>*</span>
									</dt>
									<dd align="left">
										<div>
											<div>
												<label>
													<select name="sido" id="sido"></select>
													<select name="sigungu" id="sigungu"></select>
												</label>
											</div>
										</div>
										<div>
											<label>
												<input type="text" id="location" name="location" class="input-default"
												placeholder="상세주소 및 장소명을 입력해주세요." value>
											</label>
										</div>
									</dd>
									<dt id="mt_schedule" align="left">
									모임 일정
									<span>*</span>
									</dt>
									<dd id="mt_schedule_detail" align="left">
										<div>
											<div>
												<label>
													<i></i>
													<input type="date" id="mt_date" name="mt_date" class="input-date" 
													placeholder="날짜" value>
												</label>
											</div>
											<div>
												<label>
													<i></i>
													<input type="time" id="mt_time" name="mt_time" class="input-default"
													placeholder="시간" value>
												</label>
											</div>
										</div>
									</dd>
									<dt id="rcrt_prd" align="left">
									모집 기간
									<span>*</span>
									</dt>
									<dd id="rcrt_prd_detail" align="left">
										<div>
											<div>
												<label for="str_date">
													<i></i>
													<input type="date" id="str_date" name="str_date" class="input-default" 
													placeholder="시작날짜" readonly>
												</label>
												<label for="ed_date">
													<i></i>
													<input type="date" id="ed_date" name="ed_date" class="input-default"
													placeholder="종료날짜" value>
												</label>
											</div>
										</div>
									</dd>
									<dt align="left">
									모임 인원
									<span>*</span>
									</dt>
									<dd align="left">
										<div>
											<div>
												<label for="nm_ppl">
													<input type="number" id="nm_ppl" name="nm_ppl" class="input-default"
													placeholder="인원 수를 입력하세요.">
													<small id="nm_ppl_help" class="form-text text-muted">숫자만 입력</small>
												</label>
											</div>
										</div>
									</dd>
									<dt id="mt_cost" align="left">
									참가비용(원)
									</dt>
									<dd id="mt_cost_detail" align="left">
										<div>
											<div>
												<label for="mt_cost">
													<input type="text" id="mt_cost" name="mt_cost" class="input-default"
													placeholder="참가비 없음." readonly>
												</label>
												<label for="mt_cost_info">
													<select id="mt_cost_info" name="mt_cost_info" class="select-default" onchange="resetInputValue()" >
														<option value="참가비 없음.">---참가비 없음---</option>
														<option value="다과비">다과비</option>
														<option value="재료비">재료비</option>
														<option value="대관료">대관료</option>
														<option value="운영비">운영비</option>
														<option value="노쇼방지">노쇼방지</option>
														<option value="기타">기타</option>
													</select>
													<small id="nm_ppl_help" class="form-text text-muted">예) 5000(숫자만 입력)</small>
												</label>
											</div>
										</div>
									</dd>
									<dt align="left">
									모임 사진
									</dt>
									<dd align="left">
										<div>
											<div class="filebox">
												<label for="img">
												이미지 파일 업로드
												</label>
												<input type="file" id="img" name="img" accept="image/*">
											</div>
										</div>
									</dd>
									<dt align="left">
									모임 상세 내용
									</dt>
									<dd align="left">
										<div>
											<div>
												<!-- DB에 들어갈 때 p태그가 생기는 문제 -->
												<label class="form-label" for="summernote">
													<textarea class="form-control" id="summernote" name="content" placeholder="모임을 소개해주세요." required></textarea>
												</label>
											</div>
										</div>
									</dd>	
								</dl>
								<div>
									<div>
										<div>
										  <input class="btn-outline-primary" type="submit" value="모임 만들기" />
										</div>
										<div class="my-2 text-center">
											<c:url var="meetList" value="/meet/list">
											</c:url>
											<a class="nav-link" href="${ meetList }">취소</a>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<script src="../static/js/meet-create.js"></script>
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
		crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
	<link
		href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
		rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
	<script src="../static/summernote/lang/summernote-ko-KR.js"></script>
	<script>
	$(document)
			.ready(
					function() {
						$('#summernote')
								.summernote(
										{
											lang : 'ko-KR', // default: 'en-US'
											height : 300, // set editor height
											minHeight : null, // set minimum height of editor
											maxHeight : null, // set maximum height of editor
											focus : true, // set focus to editable area after initializing summernote
											toolbar : [
													// [groupName, [list of button]]
													[ 'fontname',
															[ 'fontname' ] ],
													[ 'fontsize',
															[ 'fontsize' ] ],
													[
															'style',
															[
																	'bold',
																	'italic',
																	'underline',
																	'strikethrough',
																	'clear' ] ],
													[
															'color',
															[ 'forecolor',
																	'color' ] ],
													[ 'table', [ 'table' ] ],
													[
															'para',
															[ 'ul', 'ol',
																	'paragraph' ] ],
													[ 'height', [ 'height' ] ],
													[
															'view',
															[ 'fullscreen',
																	'help' ] ] ],
											fontNames : [ 'Arial',
													'Arial Black',
													'Comic Sans MS',
													'Courier New', '맑은 고딕',
													'궁서', '굴림체', '굴림', '돋움체',
													'바탕체' ],
											fontSizes : [ '8', '9', '10', '11',
													'12', '14', '16', '18',
													'20', '22', '24', '28',
													'30', '36', '50', '72' ]
										});
					});
</script>
</body>
<%@ include file="../common/footer.jsp"%>