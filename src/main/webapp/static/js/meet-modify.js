/**
 * meet-modify.js
 * 정지언
 */

document.addEventListener('DOMContentLoaded', function() {
	const modifyForm = document.querySelector('#modifyForm');

	const btnDelete = document.querySelector('#btnDelete');
	const btnCancel = document.querySelector('#btnCancel');

	// 모임 수정 취소 버튼
	btnCancel.addEventListener('click', () => {
		const check = confirm('작성하신 내용은 저장되지 않습니다. 모임 수정을 취소하시겠습니까?');
		if (check) {
			history.go(-1); // 취소하면 이전 페이지로 이동
		}
	});

	// 모임 삭제 버튼
	btnDelete.addEventListener('click', () => {
		const result = confirm('모임을 정말 삭제할까요?');
		console.log(`삭제 확인 결과 = ${result}`);
		console.log(mtid);

		if (result) {
			modifyForm.action = './delete?mtid=' + mtid.value;
			modifyForm.method = 'post';
			modifyForm.submit();

		}
	});

		/*		const formFile1 = document.querySelector('input#formFile1');
				const formFile2 = document.querySelector('input#formFile2');
				const formFile3 = document.querySelector('input#formFile3');
				const formFile4 = document.querySelector('input#formFile4');
				const formFile5 = document.querySelector('input#formFile5');*/

	// 모임 수정 버튼
	const btnUpdate = document.querySelector('#btnUpdate');
	btnUpdate.addEventListener('click', (e) => {
		e.preventDefault();
		const title = document.querySelector('input#title').value;
		const mt_date = document.querySelector('input#mt_date').value;
		const mt_time = document.querySelector('input#mt_time').value;

		if (title.trim() === '' || mt_date.trim() === '' || mt_time.trim() === '') {
			alert('제목과 모임 일정은 필수입력 항목입니다.');
			return;
		}

		const check = confirm('모임을 수정하시겠습니까?');
		if (check) {
			modifyForm.submit();
		}
	});

});

const mtCostInfo = document.querySelector('textarea#getMtCostInfo').value;
$("#mt_cost_info").val(mtCostInfo);


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

});

// 페이지를 불러왔을 때 함수를 바로 실행 시켜줌
document.addEventListener('DOMContentLoaded', function() {
	setMinMeetDate();
});

// 모임날짜를 수정할 때 모집날짜 이후로만 수정할 수 있게 제한을 두는 함수
function setMinMeetDate() {
	const meetDateInput = document.getElementById('ed_date').value;
	document.getElementById('mt_date').setAttribute('min', meetDateInput);
}

// 이미지 미리보기
function imageUpload(input) {
	const preview = input.parentElement.querySelectorAll('.imagePreview');
	preview.forEach((pre) => {
		const reader = new FileReader();
		reader.onload = function(e) {
			pre.src = e.target.result;
		};
		if (input.files && input.files[0]) {
			reader.readAsDataURL(input.files[0]);
		} else {
			pre.src = "";
		}
	})

}


