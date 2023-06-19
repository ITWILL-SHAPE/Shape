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
						<h1>남 녀 비율</h1>
						<canvas id="chart1" width="400" height="400"></canvas>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript">
		  /* 여기서 이름 지은 거 */
		  const DATA_COUNT = 2; // 차트에 표시할 데이터 개수
		  const NUMBER_CFG = {count: DATA_COUNT, min: 0, max: 100};

		  const data = {
		    labels: ['Blue','Yellow'],
		    datasets: [
		      {
		        label: ['남자 접속률', '여자 접속률'],
		        data : ['60', '40'],
		        backgroundColor: ['#3B7CFF','#D3FF31'],
		      }
		    ]
		  };

		  let chart1 = document.getElementById("chart1");
		  new Chart(chart1, {
		    type: 'doughnut', // 원하는 타입의 차트 타입쓰면 됨.
		    data: data,
		    options: {
		      responsive: true,
		      plugins: {
		        legend: {
		          position: 'top',
		        },
		        title: {
		          display: true,
		          text: '참여율'
		        }
		      }
		    }
		  });
		</script>

	</body>
</html>