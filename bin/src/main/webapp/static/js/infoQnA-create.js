/**
 * infoQnA_create < create.jsp 적
 * 지현 infoQnA 비밀글 체크박스
 */
document.addEventListener('DOMContentLoaded', () => {

	const checkbox = document.querySelector('#checkbox');
		const check = checkbox.checked;

		if (check) {
			document.getElementById('secret').innerText = 'Y';
		} else {
			document.getElementById('secret').innerText = 'N';
		}

	document.getElementById('checkbox').onclick = function() {

		const checkbox = document.querySelector('#checkbox');
		const check = checkbox.checked;

		if (check) {
			document.getElementById('secret').innerText = 'Y';
		} else {
			document.getElementById('secret').innerText = 'N';
		}

	}

});