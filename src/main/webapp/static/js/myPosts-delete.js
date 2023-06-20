/**
 * myPosts.jsp 에서 사용
 */
document.addEventListener('DOMContentLoaded', () => {
	var deleteButton = document.querySelector('.delete-button');
	var allCheckbox = document.getElementById('all-checkbox');
	var rowCheckboxes = document.querySelectorAll('input[id="row-checkbox"]');

	allCheckbox.addEventListener('change', () => {
		var isChecked = allCheckbox.checked;

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

				const urlParams = new URLSearchParams(window.location.search);
				let pageNum = urlParams.get('pageNum');

				if (pageNum === null) {
					pageNum = 1;
				}

				console.log(pageNum);

				// 삭제 작업 완료 후 처리할 내용
				//location.reload(); // 페이지 새로고침
				//table.innerText = response.data;
				updateTable(pageNum);

				deleteButton = document.querySelector('.delete-button');
				rowCheckboxes = document.querySelectorAll('input[id="row-checkbox"]');

				allCheckbox.addEventListener('change', () => {
					isChecked = allCheckbox.checked;

					rowCheckboxes.forEach((checkbox) => {
						checkbox.checked = isChecked;
					});
				});
				
				allCheckbox.checked = false;
			})
			.catch((error) => {
				// 에러 발생 시 처리할 내용
				console.log('Error: ' + error);
			});
	});

	function updateTable(pageNum) {
		axios.get('/shape/updateposts', { params: { id: id, pageNum: pageNum } })
			.then((response) => {
				const tableData = response.data;
				const tbody = document.querySelector('tbody');
				tbody.innerHTML = generateTableRows(tableData);

				// 체크박스 이벤트 리스너 다시 등록
				rowCheckboxes = document.querySelectorAll('input[id="row-checkbox"]');
				rowCheckboxes.forEach((checkbox) => {
					checkbox.addEventListener('change', () => {
						if (checkbox.checked) {
							deleteButton.disabled = false; // 체크박스가 선택되면 삭제 버튼 활성화
						} else {
							const checkedCheckboxes = document.querySelectorAll('input[id="row-checkbox"]:checked');
							if (checkedCheckboxes.length === 0) {
								deleteButton.disabled = true; // 선택된 체크박스가 없으면 삭제 버튼 비활성화
							}
						}
					});
				});
			})
			.catch((error) => {
				console.log('Error: ' + error);
			});
	}

	// 테이블 행 생성 함수
	function generateTableRows(tableData) {
		let rows = '';
		tableData.forEach((data, index) => {
			const createdDate = formatDate(data.created_date); // 날짜 포맷팅 처리
			const row = `
      <tr class="row-separator">
        <td class="text-center"><input type="checkbox" id="row-checkbox" /></td>
        <td class="text-center mainColor">${index + 1}</td>
        <td class="row-content"><a href="/shape/post/detail?pid=${data.pid}" class="text-decoration-none text-dark">${data.title}</a></td>
        <td style="display: none;"><input type="hidden" id="pid" value="${data.pid}" /></td>
        <td class="text-center">${createdDate}</td>
      </tr>
    `;
			rows += row;
		});
		return rows;
	}

	// 날짜 포맷팅 함수
	function formatDate(dateString) {
		const date = new Date(dateString);
		const formattedDate = `${date.getFullYear()}-${(date.getMonth() + 1).toString().padStart(2, '0')}-${date.getDate().toString().padStart(2, '0')} ${date.getHours().toString().padStart(2, '0')}:${date.getMinutes().toString().padStart(2, '0')}`;
		return formattedDate;
	}
});