/**
 * inputPwd-confirm.js
 * /mypage/memberinfo/confirmPwd.jsp 에서 사용
 */
document.addEventListener('DOMContentLoaded', () => {
	const btnConfirm = document.querySelector('.btn.btn_login.btn-classic');
	
	btnConfirm.addEventListener('click', async (e) => {
		e.preventDefault();
		const inputPwd = document.querySelector('input#inputPwd').value;

		try {
			const response = await axios.post('/shape/confirmpwd', { id: id, inputPwd: inputPwd },
			 {
				headers: {
					'Content-Type': 'application/json'
				}
			});
			const isMatched = response.data;

			if (isMatched) {
				window.location.href = '/shape/modifypwdpage';
			} else {
				alert('비밀번호가 일치하지 않습니다.');
			}
		} catch (error) {
			console.error(error);
		}
	});
});