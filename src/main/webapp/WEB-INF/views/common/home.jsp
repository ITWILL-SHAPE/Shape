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
				<div class="row h-100">
					<div class="col-6 text-center p-3" style="border: 1px solid darkgray;">
						<!-- id를 하나 정하고 script에서 지정(크기를 변경하고 싶으면 여기서) -->
						<!-- https://www.chartjs.org/docs/3.3.0/samples/bar/vertical.html -->
						<!-- 위에 있는 링크로 가보면 sample을 볼 수 있으니 참고 -->
						<h1>GENDER 회원수 비율</h1>
						<div>
							<canvas id="chart1" width="400" height="400" class="m-auto"></canvas>
						</div>
					</div>
					<div class="col-6 text-center p-3" style="border: 1px solid darkgray;">
						<h1>카테고리 별 모임 개수</h1>
						<div>
							<canvas id="categoryMeetChart" width="700" height="400" class="m-auto"></canvas>
						</div>
					</div>
					<div class="col-12 text-center p-3" style="border: 1px solid darkgray;">
						<h1>지역 별 모임 분포</h1>
						<canvas id="areaMeetChart" style="width: 80%; height: 90%;"class="m-auto"></canvas>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript">
			const DATA_COUNT = 2; // 차트에 표시할 데이터 개수
			const NUMBER_CFG = {count: DATA_COUNT, min: 0, max: 100};
			/* 여기서 이름 지은 거 */
			const data = {
			  labels: ['Male', 'Female'],
			  datasets: [
			    {
			      data : ['60', '40'], // 쿼리에서 가져오면 됨.. ㅇㅇ 근데 어떻게 MODEL 에서 가져올까요? 나도 몰라요~
			      backgroundColor: ['#3B7CFF','#D3FF31'],
			    }
			  ]
			};

			let chart1 = document.getElementById("chart1");
			new Chart(chart1, {
			  type: 'doughnut', // 원하는 타입의 차트 타입쓰면 됨.
			  data: data,
			  options: {
			    responsive: false,
			    plugins: {
			      legend: {
			        position: 'top',
			      },
			      title: {
			        display: true,
			        text: '참여율'
			      },
			      animation: {
			    	  animateScale: true,
			    	  animateRotate: true
			      }
			    }
			  }
			});
			
			// 카테고리 별 모임 개수
			let categoryMeetChart = document.getElementById("categoryMeetChart");
			const categoryMeetCntData = {
			  labels: ['운동·액티비티', '음식·음료', '취미', '여행·동행', '자기계발·교육', '동네·친목', '문화·예술', '기타'],
			  datasets: [
			    {
			      data : ['1', '3', '4', '5', '21', '12', '24', '12'],
			      backgroundColor: ['red', 'blue', 'orange', 'pink', 'green', 'yellow', 'brown', 'black'],
			    }
			  ]
			};
			new Chart(categoryMeetChart, {
			  type: 'bar', // 원하는 타입의 차트 타입쓰면 됨.
			  labels: ['운동·액티비티', '음식·음료', '취미', '여행·동행', '자기계발·교육', '동네·친목', '문화·예술', '기타'],
			  data: categoryMeetCntData,
			  options: {
			    responsive: false,
			    plugins: {
			      legend: {
			        position: 'top',
			      },
			      title: {
			        display: true,
			        text: '카테고리 별 모임 개수'
			      },
			      animation: {
			    	  animateScale: true,
			    	  animateRotate: true
			      }
			    }
			  }
			});
			
			// 지역별 모임 분포
			let areaMeetChart = document.getElementById('areaMeetChart');
			const areaMeetData = {
			  labels: ['서울특별시', '인천광역시', '대전광역시', '광주광역시', '대구광역시', '울산광역시', '부산광역시', '경기도', '강원도', '충청북도', '충청남도', '전라북도', '전라남도', '경상북도', '경상남도', '제주도'],
			  datasets: [
			    {
			      label: '남자',
			      data: ['1', '3', '4', '5', '21', '12', '24', '12'],
			      borderColor: '#3B7CFF',
			      backgroundColor: '#3B7CFF',
			      borderWidth: 2,
			      borderRadius: Number.MAX_VALUE,
			      borderSkipped: false,
			    }
			  ]
			};
			new Chart(areaMeetChart, {
				type: 'bar',
				  data: areaMeetData,
				  options: {
				    responsive: false,
				    plugins: {
				      legend: {
				        position: 'top',
				      },
				      title: {
				        display: true,
				        text: 'Chart.js Bar Chart'
				      }
				    }
				  }
			});
		</script>

	</body>
</html>