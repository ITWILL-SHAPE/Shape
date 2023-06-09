<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ include file="../common/header.jsp" %>

<body>
	<div id="detaillmain container">
      <div class="border bg-body rounded shadow-sm meetCreateBox">
        <div class="my-4">
          <header class="d-grid my-4 col-7 mx-auto m-5 text-center my-2">
                     <h1>모임 상세보기</h1>
          </header>
          <div>
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
						<!-- <svg class="bd-placeholder-img" width="100%" height="100%"
							xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
							preserveAspectRatio="xMidYMid slice" focusable="false">
							<rect width="100%" height="100%" fill="#777"></rect></svg> -->
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

				<!-- 사진 끝 -->
            </div>
                  <!-- 제목, 내용 -->
           <div> 
            <div class="card">
               <div class="card-body">   
                  <div>
                     <div class="my-4 card-subtitle mb-2 text-body-secondary">
                        <h6 id="sido" readonly>${ meetmaindetail.sido }</h6>
                     </div>
                     <div calss="my-4 card-title">
                        <h3 id="title" readonly>${ meetmaindetail.title }</h3>
                        
                     </div>
                  </div>
                     <div class="meeetcontent">
                        <ul>
                           <div id="category"class="my-2">
                              <li>
                              <sapn>🏷[분야] : </sapn>
                               <i> ${ meetmaindetail.category }</i>
                              </li>
                           </div>
                           <div id="sido_sigungu" class="my-2">
                              <li>
                              <sapn>🏳‍[지역] : </sapn>
                              <i>${meetmaindetail.sido} ${meetmaindetail.sigungu }</i>                           
                              </li>
                           </div>
                           <div id="meet_date_time"class="my-2">
                              <li>
                              <sapn>🗓[모집일정] : </sapn>
                              <i>${meetmaindetail.mt_date}</i>
                              <i>${meetmaindetail.mt_time }</i>                           
                              </li>
                           </div>
                           <div id="end_date"class="my-2">
                           <span>⏰[모집기간] : </span>
                              <i>${meetmaindetail.ed_date} 까지</i>
                              </li>
                           </div>
                           <div id="meet_ppl" class="my-2">
                              <span>🙋🏻‍♀️[인원] : <span>
                              <i>${meetmaindetail.nm_ppl} 명</i>
                              </li>
                           </div>
                           <div id="cost" name="cost" class="my-2">
                              <span>💸참가비용 : </span>
                              <i>${meetmaindetail.mt_cost} 원</i>
                              </li>                
                           </div>
                            <div id="cost_info" name="cost_info" class="my-2">
                              <span>📝비용내용 : </span>
                              <i>${meetmaindetail.mt_cost_info}</i>
                              </li>                
                           </div>
                           <div id="content" name="content" class="my-2">
                              <span>📝내용 : </span>
                              <i>${meetmaindetail.content}</i>
                              </li>                
                           </div>
                        </ul>
                     </div>
                     <!-- 로그인한 유저 -->
                     <sec:authorize access="isAuthenticated()">
	                     <sec:authentication property="principal.username" var="loginUser"/>
	                     <!-- 이 글을 작성한 유저 -->
	                     <c:set var="author" value="${ meetmaindetail.crtr_id }"/>
	                   
	                     <!-- 로그인한 유저와 이 글을 작성한 유저가 다를 경우 visible -->
	                     <c:if test="${ author != loginUser }">
	                        <div class=" d-grid gap-2 d-md-block  mx-auto my-2" style="text-align: center;">
	                           <button id="like" name="like" type="submit" class="btn btn-outline-danger btn-lg">찜 클릭 ♥ </button>
	                           <button id="join" name="join" type="submit" class="btn btn-outline-primary btn-lg">참여하기</button>
	                        </div>
	                     </c:if>
	                     <!-- 로그인한 유저와 이 글을 작성한 유저가 같을 경우 visible -->
	                     <c:if test="${ author == loginUser }">
	                        <div>
	                           <div class=" d-grid gap-2 d-md-block  mx-auto my-2" style="text-align: center;">
	                           <c:url var="updatePage" value="/meet/update">
	                             <c:param name="mtid" value="${meetmaindetail.mtid}"></c:param>     
	                           </c:url>
	                           <a href="${ updatePage }" type="button" class="btn btn-outline-primary btn-lg" id="btnUpdate" name="btnUpdate">수정하기</a>
	                           <a href="${delete }" type="button" class="btn btn-outline-danger btn-lg" id="btnDelete" name="btnDelete">삭제하기</a>   
	                           </div>
	                        </div>
	                     </c:if>
	                 </sec:authorize>
                     
                     <!-- 프로필 -->
                     <p class="my-4">🙋🏻‍♂️HOST</p>
                     	
                        <div class="card my-4">
                              <div class="card-body">
                                 <img id="host-profile" class="user-img" src="../static/images/sample/user.png" alt="host 사진">                             
                                 <div id="host-name" class="meetdetailuser"> 이름 : ${ meetmaindetail.userHost.name }</div>
                                 <div id="host-email" class="meetdetailemail">이메일 : ${ meetmaindetail.userHost.email }</div>                              
                        </div>
                     </div>
                     
                     <!-- 참여자 목록 -->
                     <div>
   						   <p class="my-4">👪GUEST</p> 						
                           
                     		<div class="card my-2">
                     			<div class="card-header fw-bold">
                     			<button class="btn" id="btnToggleReply">
                        			<img id="toggleBtnIcon" 
                            		src="<%=request.getContextPath()%>/static/images/sample/toggle-off.png" 
                            		alt="toggle-off" width="45"/>
                   				</button>
                   				</div>
                   				<div id="replyToggleDiv" class="collapse">
                     			<c:forEach items="${ meetmaindetail.prtcpDtoList }" var= "list">	
	                              <div class="card-body" id="GUEST" name="GUEST">
	                                 <img id="profile-guest" name="profile-guest" class="user-img" src="../static/images/sample/user.png" alt="host 사진">                             
	                                 <div id="guest-name" name="guest-name" class="meetdetailuser">이름: ${ list.name }</div>
	                                 <div id="guest-email" name="guest-email" class="meetdetailemail">이메일:${ list.email }</div> 
	                              </div>
	                             </c:forEach> 
	                             </div>                           
	                        </div>
                     	
                     </div>               
                  </div>
                  <!--목록 페이지로 가기 -->
                        <div class="d-grid gap-2 col-6 mx-auto my-4">
                        <c:url var="listPage" value="/meet/list">   
                        </c:url>
                        <a href="${ listPage }" type="button" class="btn btn-outline-success btn-lg">목록</a>   
                        </div>
               </div>   
            </div>
           </div> 
         </div>     
  		<script src=" <%=request.getContextPath()%>/static/js/meet-maindetaill.js"></script>	
  		<script src=" <%=request.getContextPath()%>/static/js/meet-hostdetaill.js"></script>
</body>

<%@ include file="../common/footer.jsp"%>