/**
 * modifyPwd.jsp에서 사용
 */
document.addEventListener('DOMContentLoaded', () => {
	const modifyPwdForm = document.querySelector('.modifyPwd_form');
	const btnSubmit = document.querySelector('.btn_submit');
	const btnCancel = document.querySelector('.btn_cancel');

	btnSubmit.addEventListener('click', async (e) => {
		e.preventDefault();

		const inputPwd = document.querySelector('input#nowPwd').value;
		const newPwd = document.querySelector('input#newPwd').value;
		const rePwd = document.querySelector('input#rePwd').value;

		console.log(newPwd);
		console.log(rePwd);

		try {
			let response = await axios.post('/shape/confirmpwd', { id: id, inputPwd: inputPwd }, {
				headers: {
					'Content-Type': 'application/json'
				}
			});
			console.log(response);
			const isMatched = response.data;
			if (isMatched) {
				if (inputPwd !== newPwd || inputPwd !== rePwd) {
					if (newPwd === rePwd) {
						const passwordRegex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&^~\-_.])[A-Za-z\d@$!%*#?&^~\-_.]{8,}$/;
						if (passwordRegex.test(newPwd)) {
							try {
								response = await axios.post('/shape/modifypwd', { id: id, newPwd: newPwd },
								{
									headers: {
										'Content-Type': 'application/json'
									}
								});
								const isModified = response.data;
								if (isModified) {
									alert('비밀번호 변경 완료');
									modifyPwdForm.action = '/shape/myprofile';
									modifyPwdForm.method = 'get';
									window.location.href = modifyPwdForm.action + '?id=' + id;
								} else {
									cosole.error(error);
									alert('비밀번호 변경 실패. 관리자에게 문의해주세요.');
								}
							} catch (error) {
								console.error(error);
								alert('비밀번호 변경 실패. 관리자에게 문의해주세요.');
							}
						} else {
							alert('영문, 특수문자와 숫자를 포함하여 최소 8자 이상 입력해주세요');
						}
					} else {
						alert('새로운 비밀번호를 확인해주세요.');
					}
				} else {
					alert('현재 비밀번호와 새로운 비밀번호가 일치합니다.');
				}
			} else {
				alert('현재 비밀번호가 일치하지 않습니다.');
			}
		} catch (error) {
			alert('비밀번호 변경 실패. 관리자에게 문의해주세요.');
		}

	});

	btnCancel.addEventListener('click', () => {
		window.location.href = '/shape/myprofile';
	});
});