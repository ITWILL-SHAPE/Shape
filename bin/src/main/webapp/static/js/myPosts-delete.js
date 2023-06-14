/**
 * myPosts.jsp 에서 사용
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
		const selectedPids = [];
		rowCheckboxes.forEach((checkbox) => {
			if (checkbox.checked) {
				const pid = checkbox.closest('tr').querySelector('#pid').value;
				console.log(pid);
				
				selectedPids.push({ pid: pid });
				console.log(selectedPids);
			}
		});

		//Ajax, RESTful API DELETE
		axios({
			method: 'delete',
			url: '/shape/deleteposts',
			data: selectedPids,
			headers: { 'Content-Type': 'application/json' }
		})
			.then((response) => {
				if (!response.data) {
					throw new Error('댓글 삭제에 실패했습니다.');
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