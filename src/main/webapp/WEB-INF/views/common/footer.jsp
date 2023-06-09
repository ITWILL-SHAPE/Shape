<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
		<div class="moveTopBtn">
		<img src="<%=request.getContextPath()%>/static/images/common/topBtn.png" class="topBtnImage"/>
		</div>
		<div class="moveBottomBtn">
		<img src="<%=request.getContextPath()%>/static/images/common/bottomBtn.png" class="bottomBtnImage"/>
		</div>
		</div>
		<footer class="py-3 mt-5">
			<div class="footer-content">
				<div class="link">
					<ul class="content_list">
						<li>
							<a href="https://github.com/ITWILL-SHAPE/Shape" target="_blank"
								class="text-dark">
								<i class="bi bi-github"></i>
							</a>
						</li>
						<li>
							<a href="https://www.itwill.co.kr/" target="_blank"
								class="text-dark">
								<i class="bi bi-gear-wide-connected"></i>
							</a>							
						</li>
					</ul>						
				</div>
				<p class="company">(주) 8월</p>
				<p class="company"><i class="bi bi-award"></i> 오정훈 선생님</p>
				<p class="creator"><i class="bi bi-people-fill"></i> 김세이 김지민 남지현 배선영 손창민 우수빈 정지언 하지윤</p>
			</div>
			<p class="text-center">© 2023 Company, Inc</p>
			
			
		</footer>

		<!-- 구 디자인 -->
		<!-- <footer>
			<div class="footer-content">
				<div class="link">
					<ul class="content_list">
						<li>
							<a href="" target="_blank">
								<i class="bi bi-github"></i>
							</a>
						</li>
					</ul>						
				</div>
				<p class="company">회사명: (주) 8월</p>
				<p class="creator">만든이: 김세이 김지민 남지현 배선영 손창민 우수빈 정지언 하지윤</p>
			</div>
		</footer> -->
	</body>
</html>
<script src="<%=request.getContextPath()%>/static/js/moveButton.js"></script>