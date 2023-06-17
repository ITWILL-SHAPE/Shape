<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<!-- 반응형 웹 페이지 -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<!-- css -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
		<link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/common.css"/>
		<!-- js -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
		<script src="<%=request.getContextPath()%>/static/js/mngr-sidebar.js"></script>
		<!-- 차트를 그릴 수 있는 js -->
		<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
		<!-- icon -->
		<link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/static/images/common/favicon.ico">
		<title>Shape - 관리자</title>
	</head>
	<body>
		<div class="d-flex">
			<%@ include file="./mngr_sidebar.jsp" %>
			
			<div class="vh-100 vw-100 p-3">
				<div class="row">
					<div class="col-6">
						<!-- id를 하나 정하고 script에서 지정(크기를 변경하고 싶으면 여기서) -->
						<!-- https://www.chartjs.org/docs/3.3.0/samples/bar/vertical.html -->
						<!-- 위에 있는 링크로 가보면 sample을 볼 수 있으니 참고 -->
						<h1>쿼리짜긴 귀찮아서 그냥 만든 예시</h1>
						<canvas id="chart1" width="400" height="400"></canvas>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript">		
			/* 여기서 이름 지은 거 */
			let chart1 = document.getElementById("chart1");
			/* new Chart(<여기서 씀>, {}) */
			let example = new Chart(chart1, {
				type: 'line', 	// 여기서 원하는 타입의 차트 타입쓰면 됨.
				data: {
					labels: ["1월", "2월", "3월", "4월"],
					datasets : [{
						label : '여자 접속률',
						data : ["50", "60", "30", "90"],	// 쿼리로 가져온 값 넣기
						borderColor : '#3B7CFF',	// 원하는 색
						backgroundColor : '#3B7CFF'	// 원하는 색
					}, {
						label : '남자 접속률',
						data : ["60", "30", "90", "10"],	// 쿼리로 가져온 값 넣기
						borderColor : '#D3FF31',	// 원하는 색
						backgroundColor : '#D3FF31'
					}]
				},
				options : {
					responsive: true,
				    plugins: {
				      legend: {
				        position: 'top',
				      },
				      title: {
				        display: true,
				        text: '예시'
				      }
				    }
				}				
			});
		
		</script>
	</body>
</html>