/**
 * meet-modify.js
 * 정지언
 */

	document.addEventListener('DOMContentLoaded', function() {
		const modifyForm = document.querySelector('#modifyForm');

		const mtid = document.querySelector('#mtid').value;
		const title = document.querySelector('input#title').value;
		const mt_date = document.querySelector('input#mt_date').value;
		const mt_time = document.querySelector('input#mt_time').value;
		const mt_cost = document.querySelector('input#mt_cost').value;
		const mt_cost_info = document.querySelector('select#mt_cost_info').value;
		const formFile_1 = document.querySelector('input#formFile_1').value;
		const formFile_2 = document.querySelector('input#formFile_2').value;
		const formFile_3 = document.querySelector('input#formFile_3').value;
		const formFile_4 = document.querySelector('input#formFile_4').value;
		const formFile_5 = document.querySelector('input#formFile_5').value;
		const summernote = document.querySelector('textarea#summernote').value;

		const btnUpdate = document.querySelector('#btnUpdate');
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

			if (result) {
				modifyForm.action = './delete?mtid=' + mtid;
				modifyForm.method = 'post';
				modifyForm.submit();

			}
		});
	
		// 모임 수정 버튼
		btnUpdate.addEventListener('click', () => {
			event.preventDefault();

			if (title === '' || mt_date === '' || mt_time === '') {
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

		function updateCharCount() {
			const textarea = document.getElementById("myTextarea");
			const charCount = document.getElementById("charCount");
			const text = textarea.value;
			const count = text.length;
			charCount.textContent = count;
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
