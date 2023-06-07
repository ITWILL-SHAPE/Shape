/**
 * myComments.jsp에서 사용
 */
document.addEventListener('DOMContentLoaded', () => {
	const deleteButton = document.querySelector('.delete-button');
	const allCheckbox = document.getElementById('all-checkbox');
	const rowCheckboxes = document.querySelectorAll('input[id=row-checkbox]');

	allCheckbox.addEventListener('change', () => {
		const isChecked = allCheckbox.checked;

		rowCheckboxes.forEach((checkbox) => {
			checkbox.checked = isChecked;
		});
	});

	deleteButton.addEventListener('click', () => {
		const selectedContents = [];
		rowCheckboxes.forEach((checkbox) => {
			if (checkbox.checked) {
				const contentElement = checkbox.closest('tr').querySelector('.row-content');
				if (contentElement) {
					const content = contentElement.innerText;
					selectedContents.push(content);
					console.log(content); // 선택된 행의 내용을 콘솔에 출력
				}
			}
		});
	});
});