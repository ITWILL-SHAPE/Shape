/**
 * meet-modify.js
 * 정지언
 */

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


