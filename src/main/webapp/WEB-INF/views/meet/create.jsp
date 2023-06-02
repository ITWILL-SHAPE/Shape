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
	<div>
		<div>
			<!-- 작성 -->
			<div>
				<div>
					<div>
						<h3>모임 만들기</h3>
						<div>
							<p>
							" 필수 입력 "
							<strong>*</strong>
							<br>
							" 모임 분야, 모임 장소, 모집 기간, 모임 인원은 수정할 수 없습니다. "
							</p>
						</div>
						<form action="" method="post">
							<dl>
								<dt>
								"모임 제목"
									<span>*</span>
								</dt>
								<dd>
									<div>
										<label for="title">
											<input type="text" id="title" name="title" class="input-default"
											placehoder="모임의 제목을 입력하세요." value required>
										</label>	
									</div>
								</dd>	
								<dt>
								"모임 분류"
									<span>*</span>
								</dt>
								<dd>
									<div>
										<label>
											<select>
												<option value>카테고리를 선택하세요.</option>
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
								</dd>
								<dt>
								"모임 장소"
								<span>*</span>
								</dt>
								<dd>
									<div>
										<div>
											<label> <!-- 셀렉트 박스 내용은 js에서 처리 -->
												<select name="sido" id="sido"></select>
											</label>
										</div>
										<div>
											<label> <!-- 셀렉트 박스 내용은 js에서 처리 -->
												<select name="gugun" id="gugun"></select>
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
								<dt>
								"모임 일정"
								<span>*</span>
								</dt>
								<dd>
									<div>
										<div>
											<label>
												<i></i>
												<input type="text" id="start_date" name="start_date" class="input-date" 
												placeholder="날짜" value>
											</label>
										</div>
										<div>
											<label>
												<i></i>
												<input type="time" id="start_time" name="start_time" class="input-default"
												placeholder="시간" value>
											</label>
										</div>
									</div>
								</dd>
							</dl>
						</form>
					</div>
				</div>
			</div>

		</div>
	</div>
</body>
</html>
<%@ include file="../common/footer.jsp"%>