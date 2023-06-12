/**
 * meet-create.js
 * 정지언 
 */

// 모임 만들기 취소 버튼
document.addEventListener('DOMContentLoaded', () => {
	const createForm = document.querySelector('#createForm');

	const btnCancel = document.querySelector('#btnCancel');
	btnCancel.addEventListener('click', () => {
		const check = confirm('작성하신 내용은 저장되지 않습니다. 모임 만들기를 취소하시겠습니까?');
		if (check) {
			history.go(-1); // 취소하면 이전 페이지로 이동
		}
	});
	
	// 모임 만들기 버튼
	const btnCreate = document.querySelector('#btnCreate');
	btnCreate.addEventListener('click', () => {

		event.preventDefault();
		const title = document.querySelector('input#title').value;
		const category = document.querySelector('select#category').value;
		const sido = document.querySelector('select#sido').value;
		const sigungu = document.querySelector('select#sigungu').value;
		const location = document.querySelector('input#location').value;
		const mt_date = document.querySelector('input#mt_date').value;
		const mt_time = document.querySelector('input#mt_time').value;
		const ed_date = document.querySelector('input#ed_date').value;
		const nm_ppl = document.querySelector('input#nm_ppl').value;
		if (title === '' || category === '' || sido === '' || sigungu === '' || location === '' ||
			mt_date === '' || mt_time === '' || ed_date === '' || nm_ppl === '') {
			alert('필수입력 항목을 반드시 입력해주세요.');
			return;
		}

		const check = confirm('모임 분야, 모임 장소, 모집 기간, 모임 인원은 만든 후 수정할 수 없습니다.');
		if (check) {
			createForm.submit();
		}
	});

});

// 시군구 셀렉트
$('document').ready(function() {
	const area0 = ["시/도 선택", "서울특별시", "인천광역시", "대전광역시", "광주광역시", "대구광역시", "울산광역시", "부산광역시", "경기도", "강원도", "충청북도", "충청남도", "전라북도", "전라남도", "경상북도", "경상남도", "제주도"];
	const area1 = ["강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구", "마포구", "서대문구", "서초구", "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구"];
	const area2 = ["계양구", "남구", "남동구", "동구", "부평구", "서구", "연수구", "중구", "강화군", "옹진군"];
	const area3 = ["대덕구", "동구", "서구", "유성구", "중구"];
	const area4 = ["광산구", "남구", "동구", "북구", "서구"];
	const area5 = ["남구", "달서구", "동구", "북구", "서구", "수성구", "중구", "달성군"];
	const area6 = ["남구", "동구", "북구", "중구", "울주군"];
	const area7 = ["강서구", "금정구", "남구", "동구", "동래구", "부산진구", "북구", "사상구", "사하구", "서구", "수영구", "연제구", "영도구", "중구", "해운대구", "기장군"];
	const area8 = ["고양시", "과천시", "광명시", "광주시", "구리시", "군포시", "김포시", "남양주시", "동두천시", "부천시", "성남시", "수원시", "시흥시", "안산시", "안성시", "안양시", "양주시", "오산시", "용인시", "의왕시", "의정부시", "이천시", "파주시", "평택시", "포천시", "하남시", "화성시", "가평군", "양평군", "여주군", "연천군"];
	const area9 = ["강릉시", "동해시", "삼척시", "속초시", "원주시", "춘천시", "태백시", "고성군", "양구군", "양양군", "영월군", "인제군", "정선군", "철원군", "평창군", "홍천군", "화천군", "횡성군"];
	const area10 = ["제천시", "청주시", "충주시", "괴산군", "단양군", "보은군", "영동군", "옥천군", "음성군", "증평군", "진천군", "청원군"];
	const area11 = ["계룡시", "공주시", "논산시", "보령시", "서산시", "아산시", "천안시", "금산군", "당진군", "부여군", "서천군", "연기군", "예산군", "청양군", "태안군", "홍성군"];
	const area12 = ["군산시", "김제시", "남원시", "익산시", "전주시", "정읍시", "고창군", "무주군", "부안군", "순창군", "완주군", "임실군", "장수군", "진안군"];
	const area13 = ["광양시", "나주시", "목포시", "순천시", "여수시", "강진군", "고흥군", "곡성군", "구례군", "담양군", "무안군", "보성군", "신안군", "영광군", "영암군", "완도군", "장성군", "장흥군", "진도군", "함평군", "해남군", "화순군"];
	const area14 = ["경산시", "경주시", "구미시", "김천시", "문경시", "상주시", "안동시", "영주시", "영천시", "포항시", "고령군", "군위군", "봉화군", "성주군", "영덕군", "영양군", "예천군", "울릉군", "울진군", "의성군", "청도군", "청송군", "칠곡군"];
	const area15 = ["거제시", "김해시", "마산시", "밀양시", "사천시", "양산시", "진주시", "진해시", "창원시", "통영시", "거창군", "고성군", "남해군", "산청군", "의령군", "창녕군", "하동군", "함안군", "함양군", "합천군"];
	const area16 = ["서귀포시", "제주시", "남제주군", "북제주군"];


	// 시/도 선택 박스 초기화
	$("select[name^=sido]").each(function() {
		$selsido = $(this);
		$.each(eval(area0), function() {
			$selsido.append("<option value='" + this + "'>" + this + "</option>");
		});
		$selsido.next().append("<option value=''>구/군 선택</option>");
	});


	// 시/도 선택시 구/군 설정
	$("select[name^=sido]").change(function() {
		const area = "area" + $("option", $(this)).index($("option:selected", $(this))); // 선택지역의 구군 Array
		const $sigungu = $(this).next(); // 선택영역 군구 객체
		$("option", $sigungu).remove(); // 구군 초기화

		if (area == "area0")
			$sigungu.append("<option value=''>구/군 선택</option>");
		else {
			$.each(eval(area), function() {
				$sigungu.append("<option value='" + this + "'>" + this + "</option>");
			});
		}
	});


	// 참가비 없음을 선택하면 readonly
	$("select#mt_cost_info").change(
		function() {
			const selectedOption = $(this).val();
			const inputElement = $("input#mt_cost");

			if (selectedOption === "참가비 없음.") {
				inputElement.prop("readonly", true);
				inputElement.attr("placeholder", "참가비 없음.");
			} else {
				inputElement.prop("readonly", false);
				inputElement.attr("placeholder", "참가비용을 입력하세요.");
			}
		});

	// 글자 수 실시간 표시 및 제한
	$("#title").keyup(function(e) {
		const content = $(this).val();
		const maxLength = 80;
		$("#textLengthCheck").text("(" + content.length + " / " + maxLength + ")"); // 실시간 글자 수 표시

		if (content.length > maxLength) {
			alert("최대 80자까지 입력이 가능합니다.");
			$(this).val(content.substring(0, maxLength));
			$('#textLengthCheck').text("(" + maxLength + " / 최대 " + maxLength + "자)");
		}

		function updateCharCount() {
			const textarea = document.getElementById("myTextarea");
			const charCount = document.getElementById("charCount");
			const text = textarea.value;
			const count = text.length;
			charCount.textContent = count;
		}
	});

});

// 현재 날짜를 가져오기 위한 함수
function getCurrentDate() {
	const now = new Date();
	const year = now.getFullYear();
	const month = String(now.getMonth() + 1).padStart(2, '0');
	const day = String(now.getDate()).padStart(2, '0');
	return `${year}-${month}-${day}`;
}

// 시작날짜 입력란에 현재 날짜 자동 채우기
const startDateInput = document.getElementById('str_date');
startDateInput.value = getCurrentDate();

document.getElementById('mt_date').setAttribute('min', getCurrentDate());
document.getElementById('ed_date').setAttribute('min', getCurrentDate());

function resetInputValue() {
	document.getElementById("mt_cost").value = "";
}

// 인원수는 음수와 0을 입력하지 못하도록 입력 이벤트를 가로채고 유효성 검사 수행
document.getElementById('nm_ppl').addEventListener('input', function(e) {
	var input = e.target.value;
	if (input <= 0) {
		e.target.value = '';
	}
});

