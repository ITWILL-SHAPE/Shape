<%@page import="com.itwill.shape.dto.MeetMainDetailDto"%>
<%@page import="com.itwill.shape.dto.MeetPrtcpReadDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../common/header.jsp" %>


	<div id="detaillmain" class="container">
      <div>
        <div class="my-5 p-3">
          <div class="d-grid my-4 col-7 mx-auto m-5 text-center my-2">
                     <h1>모임 상세보기</h1>
          </div>		
		<!-- 제목, 내용 -->
			<div class="card border-0">
				<div class="card-body">
			<div class=my-5>
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
						
						<img src="<%=request.getContextPath()%>/static/images/common/Asset1.png" 
							class="bd-placeholder-img" width="100%" height="150%"/>
						<div class="container">
							<div class="carousel-caption text-start">
								
							</div>
						</div>
					</div>
					<!-- 2번쨰 -->
					<div class="carousel-item active">
						<img src="<%=request.getContextPath()%>/static/images/sample/detail2.png" 
							class="bd-placeholder-img" width="100%" height="10%"/>
						<div class="container">
							<div class="carousel-caption">	
							</div>
						</div>
					</div>
					<!-- 3번쩨 -->
					
					<div class="carousel-item">
						<img src="<%=request.getContextPath()%>/static/images/sample/detail2.png"
							class="bd-placeholder-img" width="100%" height="150%"/>

						<div class="container">
							<div class="carousel-caption text-end">
							<!-- 글쓰기 -->	
							<p class="black">마지막</p>
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
					<div class= "my-5">
					<!-- 사진-->
				<!-- 사진 끝 -->
            </div>
                  <!-- 제목, 내용 -->
           <div> 
            <div class="card">
               <div class="card-body">   
                  <!-- 큰 지역 제목 -->
                  <div>
                     <div class="my-4 card-subtitle mb-2 text-body-secondary">
                        <h6 id="sido" readonly>${ meetmaindetail.sido }</h6>
                     </div>
                     <div calss="my-4 card-title">
                        <h3 id="title" readonly>${ meetmaindetail.title }</h3>
                     </div>
                  </div>
                  <br/>
                     <!-- 내용 -->
                     <div>
						<ul>
							<div id="category" class="my-3">
								<li><sapn>🏷분야 : </sapn> 
								${ meetmaindetail.category }
								</li>
							</div>
							<div id="sido_sigungu" class="my-3">
								<li>
								<sapn>🏳‍지역 : </sapn> 
								${meetmaindetail.sido}, ${meetmaindetail.sigungu } , ${meetmaindetail.location }
								</li>
							</div>
							<div id="meet_date_time" class="my-3">
								<li>
								<sapn>🗓모집일정 : </sapn> 
								${meetmaindetail.mt_date}<span> </span>
								${meetmaindetail.mt_time }
								</li>
							</div>
							<div id="end_date" class="my-3">
								<li>
								<span>⏰모집기간 : </span> 
								${meetmaindetail.ed_date} 까지
								</li>
							</div>
							<div id="meet_ppl" class="my-3">
								<li>
								<span>🙋🏻‍♀️인원 : <span> 
								${meetmaindetail.nm_ppl} 명
								</li>
							</div>
							<div id="cost" name="cost" class="my-3">
								<li>
								<span>💸참가비용 : </span> 
								<span>[${meetmaindetail.mt_cost_info}]</span> ${meetmaindetail.mt_cost} 원
								 	<c:if test="${meetmaindetail.mt_cost == '참가비 없음.'}">
    									<span>${meetmaindetail.mt_cost}</span>
  									</c:if>
								</li>
							</div>
							<div id="cost_info" name="cost_info" class="my-3 d-none">
								<li>
								<span>🧾비용내용 : </span> 
								${meetmaindetail.mt_cost_info}
								</li>
							</div>
							<div id="content" name="content" class="my-3">
								<li>
									<span>📝내용</span> 
									<div class="border bg-body rounded mt-2 p-3">
										${meetmaindetail.content}
									</div>
								</li>
							</div>
							
						</ul>
					</div>
                     
					<!-- 로그인한 유저 -->
					<sec:authorize access="isAuthenticated()">
						<sec:authentication property="principal.username" var="loginUser" />
						<!-- 이 글을 작성한 유저 -->
						<c:set var="author" value="${ meetmaindetail.crtr_id }" />

						<!-- 사용자 정보불러오기 -->
						<input class="d-none" id="mtid" value="${ meetmaindetail.mtid }" />
						<sec:authentication property="principal.user.id" var="name" />
						<input class="d-none" id="id" value="${ id }" />
						<sec:authentication property="principal.user.name" var="name" />
						<input class="d-none" id="name" value="${ name }" />
						<sec:authentication property="principal.user.gender" var="gender" />
						<input class="d-none" id="gender" value="${ gender }" />
						<sec:authentication property="principal.user.phone" var="phone" />
						<input class="d-none" id="phone" value="${ phone }" />
						<sec:authentication property="principal.user.email" var="email" />
						<input class="d-none" id="email" value="${ email }" />

						<c:choose>
							<c:when test="${ author == loginUser }">
								<div>
									<div class=" d-grid gap-2 d-md-block  mx-auto my-2"
										style="text-align: right;">
										<c:url var="updatePage" value="/meet/update">
											<c:param name="mtid" value="${meetmaindetail.mtid}"></c:param>
										</c:url>
										<a href="${ updatePage }" type="button"
											class="btn btn-classic" id="btnUpdate" name="btnUpdate">수정</a>
									</div>
								</div>
							</c:when>

							<c:when test="${ author != loginUser }">
								<div class=" d-grid gap-2 d-md-block  mx-auto my-2" style="text-align: right;">
								
								<!-- 참여자가 찜을 눌렀을때 -->
									<c:set var="loop_like" value="false" />
									<c:forEach items="${meetmaindetail.meetLikeId}" var ="likeUser">
										<c:if test="${likeUser.id == loginUser && loop_like == false }">
											<button id="unLike" name="unLike" type="button" class="btn btn-danger" data-id="${meetmaindetail.mtid}"
												data-login="${ likeUser.id }">♥ ${meetmaindetail.meetlikecount}</button>
											
											<c:set var="loop_like" value="true" />
										</c:if>		
									</c:forEach>
									
									<!-- 참여자가 찜을 안 눌었을때  -->
									<c:if test="${likeUser.id != loginUser && loop_like == false}">
										<button id="like" name="like" type="button" class="btn btn-danger" >♡ ${meetmaindetail.meetlikecount}</button>
									</c:if>
									
									
									<!--  참여자가 모임인원이 FULL -->
									<c:set var="NumberPrtcp" value="${meetmaindetail.meetNumberPrtcp}" />
									<c:if test="${meetmaindetail.nm_ppl == NumberPrtcp  }">
										<button id="full" name="full" type="button" class="btn btn-secondary" >참여종료</button>
									</c:if>
									
									<!--  참여 인원이 NO FULL -->
								<c:if test="${meetmaindetail.nm_ppl > NumberPrtcp}">
									
									<!-- 참여자가 참여하기를 눌렀을때 -->
									<c:set var="loop_flag" value="false" />
									<c:forEach items="${ meetmaindetail.prtcpDtoList }" var="userList">
										<c:if test="${ userList.prtcp_id == loginUser && loop_flag == false }">
											<button id="delete" name="delete" type="button" class="btn btn-secondary" 
											data-id="${meetmaindetail.mtid}" data-login="${ userList.prtcp_id }">참여취소</button>
											<c:set var="loop_flag" value="true" />
										</c:if>
									</c:forEach>
									
									<!-- 참여자가 챰여하기를 안 눌었을때  -->
									<c:if test="${ userList.prtcp_id != loginUser && loop_flag == false }">
										<button id="join" name="join" type="button" class="btn btn-classic">참여</button>
									</c:if>
								
								</c:if>
									
									
									
									
									
									
									
								
								</div>
							</c:when>
						</c:choose>			
					</sec:authorize>


					<!-- 프로필 -->

					<div class="card my-2">
						<div class="card-header fw-bold">
							<p class="my-2">🙋🏻‍♂️HOST</p>
						</div>
						<div class="card-body">
							<img id="host-profile" class="user-img"
								src="../static/images/sample/user.png" alt="host 사진">
							<div id="host-name" class="meetdetailuser">이름 : ${ meetmaindetail.userHost.name }</div>
							<div id="host-email" class="meetdetailemail">이메일 : ${ meetmaindetail.userHost.email }</div>	
						</div>
					</div>
										                                  
                   <!-- 참여자 목록 -->
					<div>
					<p class="login-info-text">* 참여자는 로그인을 해야 볼 수 있습니다.</p>
						<div class="card my-2">
							<div class="card-header fw-bold">
								<div class="row">
									<p class="my-2 col">👪GUEST</p>
									<button class="btn col text-end" id="btnToggleReply">
										<img id="toggleBtnIcon" src="<%=request.getContextPath()%>/static/images/sample/toggle-off.png"											alt="toggle-off" width="45" />
									</button>
								</div>
								
									
							</div>			
								<!-- guest들은 로그인 한 사람들만 볼 수 있음 -->
								<!-- 로그인한 HOST 작성자 볼 수 있게 -->

								<sec:authorize access="isAuthenticated()">
									<c:set var="login" value="${ meetmaindetail.crtr_id }" />
									<c:if test="${ login == loginUser }">
										<div id="replyToggleDiv" class="collapse">
											<c:forEach items="${ meetmaindetail.prtcpDtoList }"
												var="list">
												<div class="card-body" id="GUEST" name="GUEST">
														<img id="profile-guest" name="profile-guest"
															class="user-img" src="../static/images/sample/user.png"
															alt="host 사진">
														<div id="guest-name" name="guest-name"
															class="meetdetailuser">이름 : ${ list.name }</div>
														<div id="guest-email" name="guest-email"
															class="meetdetailemail">이메일 : ${ list.email }</div>
													
												</div>
												</c:forEach>
										</div>
									</c:if>
									
									<!-- 로그인한 GUEST USER들도 볼 수 있게 -->
									
									<c:if test="${ login != loginUser }">
										<div id="replyToggleDiv" class="collapse">
											<c:forEach items="${ meetmaindetail.prtcpDtoList }"
												var="list">
												<div class="card-body" id="GUEST" name="GUEST">
													
														<img id="profile-guest" name="profile-guest"
															class="user-img" src="../static/images/sample/user.png"
															alt="host 사진">
														<div id="guest-name" name="guest-name"
															class="meetdetailuser">이름 : ${ list.name }</div>
														<div id="guest-email" name="guest-email"
															class="meetdetailemail">이메일 : ${ list.email }</div>
												</div>
											</c:forEach>
										</div>
									</c:if>
								</sec:authorize>
							</div>
						</div>
					</div>
				</div>
			</div>
					<!--목록 페이지로 가기 -->
					<div class="d-grid gap-2 col-2 mx-auto my-4">
						<c:url var="listPage" value="/meet/list"></c:url>
						<a href="${ listPage }" type="button" class="btn btn-list">목록</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
		

<script src=" <%=request.getContextPath()%>/static/js/meet-maindetaill.js"></script>
<script src="<%=request.getContextPath()%>/static/js/meet-modify.js"></script>
	                
              
               
  		
  		



<%@ include file="../common/footer.jsp"%>