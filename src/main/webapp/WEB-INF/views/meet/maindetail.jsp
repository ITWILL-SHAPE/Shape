<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			<div>
				<div>
					<div>
						<header>
							<h3>모임 상세보기</h3>
						</header>
						<div id="carouselExampleIndicators" class="carousek slide"> <!-- 메인 사진 넣기 --> 
							<div class="carousel-indicators">
    						<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    						<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
    						<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
  						</div>
  					<div class="carousel-inner">
    					<div class="carousel-item active">
      						<img src="..." class="d-block w-100" alt="...">
    					</div>
    					<div class="carousel-item">
      						<img src="..." class="d-block w-100" alt="...">
    					</div>
    					<div class="carousel-item">
      						<img src="..." class="d-block w-100" alt="...">
    					</div>
  					</div>
 	 						<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
    							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
    							<span class="visually-hidden">Previous</span>
  							</button>
  							<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    							<span class="carousel-control-next-icon" aria-hidden="true"></span>
    							<span class="visually-hidden">Next</span>
  							</button>
					</div>
				</div>
						<!-- 제목, 내용 -->
						<div>
							<div>
								<label for="title">제목</label>
								<input id="title" value="${ meetInfo.title }" readonly/>
							</div>
						</div>
							<div>
								<ul>
									<div>
										<li>
										 <i class="bi bi-bookmark-fill">categories</i>
										<sapn>분야</sapn>
										</li>
									</div>
									<div>
										<li>
										<i class="bi bi-flag-fill">map</i>
										<span>위치</span>
										</li>
									</div>
									<div>
										<li id="mt_schedule"">
										<i class="bi bi-calendar2-event-fill">schedule</i>
										<span>모임 일정</span>
										</li>
									</div>
									<div>
									<li id="rcrt_prd"">
										<i class="bi bi-calendar-check-fill">period</i>
										<span>모집기간</span>
										</li>
									</div>
									<div>
										<li>
										<i class="bi bi-person-fill">person</i>
										<span>인원</span>
										</li>
									</div>
									<div>
										<li id="mt_cost"">
										<i class="bi bi-cash-coin">cash</i>
										<span>참가비용</span>
										</li>
									</div>
								</ul>
							</div>
							<hr>
							<div>
								<button type="submit" class="btn-lg-primary">찜</button>
								<button type="submit" class="btn-lg-primary">참여하기</button>
							</div>
							<hr>
							<!-- 프로필 -->
							<div>
								<div>user 사진</div>
								<div>
									<div>개설자 이름</div>
									<div>개설자 이메일</div>
								</div>
							</div>
							<hr>
							<!-- 참여자 목록 -->
							<div>
								<ul>
									<li>
										<div>
											<div>user 사진</div>
											<div>
												<div>개설자 이름</div>
												<div>개설자 이메일</div>
											</div>
										</div>
									</li>
								</ul>
							</div>
							
							<!--목록 페이지로 가기 -->
							<button>목록</button>	
					</div>	
				</div>
			</div>		
		</div>
	</div>
</body>
</html>
<%@ include file="../common/footer.jsp"%>