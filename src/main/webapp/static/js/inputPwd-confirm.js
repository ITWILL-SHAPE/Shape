/**
 * pwd-confirm.js
 * /mypage/memberinfo/confirmPwd.jsp 에서 사용
 */
document.addEventListener('DOMContentLoaded', () => {
	const confirmPwdForm = document.querySelector('.confirmPwd_form');
	const userPwd = document.querySelector('input#userPwd').value;
	const inputPwd = document.querySelector('input#inputPwd').value;
	console.log(userPwd);

	const btnConfirm = document.querySelector('button.btn_confirm');


	btnConfirm.addEventListener('click', () => {
		if (inputPwd === userPwd) {
			pwdForm.action = '/shape/modifypwd';
			pwdForm.method = 'post';
			pwdForm.submit();
		} else {
			alert('비밀번호가 일치하지 않습니다');
			pwdForm.action = '/shape/confirmpwd';
		}
		pwdForm.method = 'get';
		pwdForm.submit();
	});

/*
	btnConfirm.addEventListener('click', () => {
		const username = $('input[name="username"]').val();
		const password = $('input[name="password"]').val();
		console.log(username, password);
		
		const data = {username, password};
		
		aixos.post('/shape/login', data)
		.then((response) => {
			alert('비밀번호가 맞습니다.');
			console.log(response);
		})
		.catch((error) => {
			alert('비밀번호가 틀렸습니다.');
		})
	});
	*/
});