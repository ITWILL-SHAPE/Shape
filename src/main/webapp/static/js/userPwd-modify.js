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
			//왜 안돼?
			//const response = await axios.post('/shape/confirmpwd', { params: { inputPwd } });
			console.log(response);
			const isMatched = response.data;
			//유저가 입력한 비밀번호(inputPwd)와 유저의 비밀번호와 일치하면
			if (isMatched) {
				if (inputPwd !== newPwd || inputPwd !== rePwd) {
					if (newPwd === rePwd) {
						// 비밀번호 유효성 검사
						// 영문, 특수문자와 숫자를 포함하여 최소 8자 이상 입력
						// 특수문자 추가할 거 있으면 추가하기
						const passwordRegex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&^~\-_.])[A-Za-z\d@$!%*#?&^~\-_.]{8,}$/;
						if (passwordRegex.test(newPwd)) {
							// 비밀번호 변경 요청을 컨트롤러에 전송
							try {
								response = await axios.post('/shape/modifypwd', { id: id, newPwd: newPwd }, {
									headers: {
										'Content-Type': 'application/json'
									}
								});
								console.log(response);

								const isModified = response.data;

								if (isModified) {
									// 변경 완료 후 처리할 작업 수행
									alert('비밀번호 변경 완료');
									//modifyPwdForm.action = '/shape/myprofile';
									//modifyPwdForm.method = 'get';
									//modifyPwdForm.submit();
									modifyPwdForm.action = '/shape/myprofile';
									modifyPwdForm.method = 'get';
									window.location.href = modifyPwdForm.action + '?id=' + id;
								} else {
									cosole.error(error);
									alert('비밀번호 변경 실패. 관리자에게 문의해주세요.');
								}
							} catch (error) {
								console.error(error);
								// 변경 실패 처리
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