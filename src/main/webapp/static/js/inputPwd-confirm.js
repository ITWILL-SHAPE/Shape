/**
 * pwd-confirm.js
 * /mypage/memberinfo/confirmPwd.jsp 에서 사용
 */
document.addEventListener('DOMContentLoaded', () => {
	const pwdForm = document.querySelector('.pwd_form');
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
});