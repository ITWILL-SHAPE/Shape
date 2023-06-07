<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<title>Shape</title>
<style>
    .profile {
      display: flex;
      align-items: center;
    }
  
    .user-img {
      width: 50px; /* 사용자 사진의 너비 조정 */
      height: 50px; /* 사용자 사진의 높이 조정 */
      margin-right: 10px; /* 사진과 정보 사이의 여백 조정 */
    }
  
    .user-info {
      display: flex;
      flex-direction: column;
    }
  
    .user-name, .user-email {
      font-size: 16px; /* 이름과 이메일의 글꼴 크기 조정 */
     
     .carousel-item .img-fluid {
        width: 100%;
        height: auto;

}
 </style>
</head>
<body>

         <div id="detaillmain">
            <div class="border bg-body rounded shadow-sm meetCreateBox">
               <div class="my-4">
                  <header class="d-grid my-2 col-7 mx-auto m-5 text-center my-2">
                     <h1>모임 상세보기</h1>
                  </header>
                  <div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
    				<div class="carousel-indicators">
      					<button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="" aria-label="Slide 1"></button>
      					<button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2" class="active" aria-current="true"></button>
     					<button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3" class=""></button>
    				</div>
    				<!-- 1번째 -->
    				<div class="carousel-inner">
      				<div class="carousel-item">
        			<svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"></rect></svg>
        				<div class="container">
          						<div class="carousel-caption text-start">
            						<p>사진넣기</p>
            						<p><a class="btn btn-lg btn-primary" href="#">Sign up today</a></p>
         						</div>
        				</div>
      				</div>
      				<!-- 2번쨰 -->
      			<div class="carousel-item active">
        		<svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"></rect></svg>
       	 			<div class="container">
          				<div class="carousel-caption">
            					<p>Some representative placeholder content for the second slide of the carousel.</p>
            					<p><a class="btn btn-lg btn-primary" href="#">Learn more</a></p>
          				</div>
        			</div>
      			</div>
      			<!-- 3번쩨 -->
      	<div class="carousel-item">
        <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"></rect></svg>

        	<div class="container">
          			<div class="carousel-caption text-end">
            				<p>Some representative placeholder content for the third slide of this carousel.</p>
            				<p><a class="btn btn-lg btn-primary" href="#">Browse gallery</a></p>
          			</div>
      	 	</div>
      </div>
    </div>
    			<button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
      				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
      				<span class="visually-hidden">Previous</span>
    			</button>
    			<button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
      				<span class="carousel-control-next-icon" aria-hidden="true"></span>
      				<span class="visually-hidden">Next</span>
    			</button>
  		<div>
  		<!-- 사진 끝 -->
            </div>
                  <!-- 제목, 내용 -->
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
                              <sapn>🏷분야 : </sapn>
                               <i> ${ meetmaindetail.category }</i>
                              </li>
                           </div>
                           <div id="sido_sigungu" class="my-2">
                              <li>
                              <sapn>🏳‍지역 : </sapn>
                              <i>${meetmaindetail.sido} ${meetmaindetail.sigungu }</i>                           
                              </li>
                           </div>
                           <div id="meet_date_time"class="my-2">
                              <li>
                              <sapn>🗓모집일정 : </sapn>
                              <i>${meetmaindetail.mt_date}</i>
                              <i>${meetmaindetail.mt_time }</i>                           
                              </li>
                           </div>
                           <div id="end_date"class="my-2">
                           <span>⏰모집기간 : </span>
                              <i>${meetmaindetail.ed_date} 까지</i>
                              </li>
                           </div>
                           <div id="meet_ppl" class="my-2">
                              <span>🙋🏻‍♀️인원 : <span>
                              <i>${meetmaindetail.nm_ppl} 명</i>
                              </li>
                           </div>
                           <div id="cost" class="my-2">
                              <span>💸참가비용 : </span>
                              <i>${meetmaindetail.mt_cost} 원</i>
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
	                           <a href="${ updatePage }" type="button" class="btn btn-outline-primary btn-lg" id="btnUpdate">수정하기</a>
	                           <a href="${delete }" type="button" class="btn btn-outline-danger btn-lg" id="btnDelete">삭제하기</a>   
	                           </div>
	                        </div>
	                     </c:if>
	                 </sec:authorize>
                     
                     <!-- 프로필 -->
                     <p class="my-4">🙋🏻‍♂️HOST
                        <div class="card my-4">
                              <div class="card-body">
                                 <img id="host-profile" class="user-img" src="../static/images/sample/users.png" alt="host 사진">                             
                                 <div id="host-name" class="meetdetailuser">개설자 이름</div>
                                 <div id="host-email" class="meetdetailemail">개설자 이메일</div>                              
                        </div>
                     </div>
                     
                     <!-- 참여자 목록 -->
                     <div>
                        <p class="my-4">👪GUEST</p>
                        <div class="card my-4">
                           <div class="card-body">            
                              <div>
                                 <img id="profile-guest" class="user-img" src="../static/images/sample/users.png" alt="guest 사진">                        
                                  <div id="guest-name" class="meetdetailuser">이름</div>
                                  <div id="guest-email" class="meetdetailemail">이메일</div>                              
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
   </div>
   </div>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
  <script src=" <%=request.getContextPath()%>/static/meet-maindetaill.js"></script>	
  <script src=" <%=request.getContextPath()%>/static/meet-hostdetaill.js"></script>
</body>
</html>
<%@ include file="../common/footer.jsp"%>