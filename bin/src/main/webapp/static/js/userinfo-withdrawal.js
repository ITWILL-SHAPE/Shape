/**
 * withdrawal.jsp 에서 사용
 */
document.addEventListener('DOMContentLoaded', () => {
	const form = document.querySelector('#form');
	const btnSubmit = document.querySelector('input.btn_submit');


	btnSubmit.addEventListener('click', async (e) => {
		const id = document.querySelector('span.user_id').textContent;
		const inputPwd = document.querySelector('input#inputPwd').value;

		e.preventDefault();

		try {
			let response = await axios.post('/shape/confirmpwd', inputPwd);
			console.log(response);

			const isMatched = response.data;
			console.log(isMatched);

			if (isMatched) {
				try {
					response = await axios.post('/shape/withdrawal', id);
					console.log(response);

					alert(response.data);

					form.action = '/shape';
					form.method = 'get';
					form.submit();

				} catch (error) {
					console.error(response);
				}
			} else {
				alert('비밀번호가 일치하지 않습니다.');
			}
		} catch (error) {
			console.error(error);
		}

	});
});