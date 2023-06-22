<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형 웹 페이지 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- css -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/static/css/common.css" />
<!-- js -->
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"
	integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<script src="<%=request.getContextPath()%>/static/js/mngr-sidebar.js"></script>
<!-- 차트를 그릴 수 있는 js -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<!-- icon -->
<link rel="shortcut icon" type="image/x-icon"
	href="<%=request.getContextPath()%>/static/images/common/favicon.ico">
<title>Shape - 관리자</title>
</head>
<body>
	<div class="d-flex">
		<%@ include file="./mngr_sidebar.jsp"%>

		<div class="vh-100 vw-100 p-3">
			<div class="row h-100">
				<div class="col-6 text-center p-3"
					style="border: 1px solid #3B7CFF;">
					<!-- id를 하나 정하고 script에서 지정(크기를 변경하고 싶으면 여기서) -->
					<!-- https://www.chartjs.org/docs/3.3.0/samples/bar/vertical.html -->
					<!-- 위에 있는 링크로 가보면 sample을 볼 수 있으니 참고 -->
					<h1>성별 회원수</h1>
					<div>
						<canvas id="chart1" width="400" height="400" class="m-auto"></canvas>
					</div>
				</div>
				<div class="col-6 text-center p-3"
					style="border: 1px solid #3B7CFF;">
					<h1>카테고리 모임비율</h1>
					<div>
						<canvas id="categoryMeetChart" width="700" height="400"
							class="m-auto"></canvas>
					</div>
				</div>
				<div class="col-12 text-center p-3"
					style="border: 1px solid #3B7CFF;">
					<h1>지역 모임 분포</h1>
					<canvas id="areaMeetChart" style="width: 60%; height: 80%;"
						class="m-auto"></canvas>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
			$(document).ready(function() {
				axios.post('/shape/mngr')
				.then((res) => {
					let datas = res.data;
					//console.log(datas);
					//console.log(datas.genderMale.maleCount);
					//console.log(datas.genderFemale.feMaleCount);
					
					grapeDraw(datas);
				})
				.catch((err) => {
					console.log(err);
				});
			});
			
			const grapeDraw = (datas) => {
				let male = datas.genderMale.maleCount;
				let female = datas.genderFemale.feMaleCount;
				/* 여기서 이름 지은 거 */
				const data = {
				  labels: ['Male', 'Female'],
				  datasets: [
				    {
				      data : [male, female], // 쿼리에서 가져오면 됨.. ㅇㅇ 근데 어떻게 MODEL 에서 가져올까요? 나도 몰라요~
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
				        text: 'GENDER'
				      },
				      animation: {
				    	  animateScale: true,
				    	  animateRotate: true
				      }
				    }
				  }
				});
				
				// 카테고리 별 모임 개수
				let cateCnt = [];
				let status = 0;
				for(let cate of datas.categorys) {
					cateCnt[status] = cate.categorycount ;
					status = status + 1;
				}
				// console.log(cateCnt);
				
				let categoryMeetChart = document.getElementById("categoryMeetChart");
				const categoryMeetCntData = {
				  labels: ['운동·액티비티', '음식·음료', '취미', '여행·동행', '자기계발·교육', '동네·친목', '문화·예술', '기타'],
				  datasets: [
				    {
				      label: 'Meeting',	
				      data : cateCnt,
				      backgroundColor:'#3B7CFF ',
				      borderColor : '#D3FF31',
				      borderWidth: 1,
				      borderSkipped: false
				    }
				  ]
				};
				new Chart(categoryMeetChart, {
				  type: 'line', // 원하는 타입의 차트 타입쓰면 됨.
				  data: categoryMeetCntData,
				  options: {
				    responsive: false,
				    plugins: {
				      title: {
				        display: true,
				        text:'CATEGORIES'
				      }
				    },
				      scales: {
				    	  y: {
			    	        min: 0,
			    	        ticks: {
		    	            // forces step size to be 50 units
		    	            stepSize: 5
		    	          }
			    	      }
				      }
				  }
				});
				
				// 지역별 모임 분포				
				let areamtcp = [];
				let snt = 0;
				// console.log(datas.area);
				for(let areasMrtcp of datas.area) {
					areamtcp[snt] = areasMrtcp.areacount;
					snt = snt + 1;
				}
				//console.log(areamtcp);
				let areaMeetChart = document.getElementById('areaMeetChart');
				const areaMeetData = {
				  labels: ['서울특별시', '인천광역시', '대전광역시', '광주광역시', '대구광역시', '울산광역시', '부산광역시', '경기도', '강원도', '충청북도', '충청남도', '전라북도', '전라남도', '경상북도', '경상남도', '제주도'],
				  datasets: [
				    {
				      label: 'Participation',
				      data: areamtcp,
				      borderColor: '#3B7CFF',
				      backgroundColor: '#3B7CFF',
				      borderWidth: 1,
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
					        text: 'AREA'
					      }
					    }
					  }
				});
			}
			
		</script>

</body>
</html>