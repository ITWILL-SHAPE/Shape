/**
 * myComments.jsp에서 사용
 */
document.addEventListener('DOMContentLoaded', () => {
	const deleteButton = document.querySelector('.delete-button');
	const allCheckbox = document.getElementById('all-checkbox');
	const rowCheckboxes = document.querySelectorAll('input[id="row-checkbox"]');
	const table = document.querySelector('.table');

	allCheckbox.addEventListener('change', () => {
		const isChecked = allCheckbox.checked;

		rowCheckboxes.forEach((checkbox) => {
			checkbox.checked = isChecked;
		});
	});

	deleteButton.addEventListener('click', () => {
		const selectedPcids = [];
		rowCheckboxes.forEach((checkbox) => {
			if (checkbox.checked) {
				const pcid = checkbox.closest('tr').querySelector('#pcid').value;
				console.log(pcid);
				
				selectedPcids.push({ pcid: pcid });
				console.log(selectedPcids);
			}
		});

		//Ajax, RESTful API DELETE
		axios({
			method: 'delete',
			url: '/shape/deletecomments',
			data: selectedPcids,
			headers: { 'Content-Type': 'application/json' }
		})
			.then((response) => {
				if (!response.data) {
					throw new Error('댓글 삭제에 실패 했습니다.');
				}
				// 삭제 작업 완료 후 처리할 내용
				location.reload(); // 페이지 새로고침
				//table.innerText = response.data;
			})
			.catch((error) => {
				// 에러 발생 시 처리할 내용
				console.log('Error: ' + error);
			});
	});
});