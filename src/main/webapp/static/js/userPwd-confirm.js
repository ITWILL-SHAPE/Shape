/**
 * modifyPwd.jsp에서 사용
 */
document.addEventListener('DOMContentLoaded', () => {
	const pwdConfirm = document.querySelector('#pwdConfirm');
	const userPwd = document.querySelector('input#userPwd').value;
	const inputPwd = document.querySelector('input#nowPwd').value;
	const newPwd = document.querySelector('input#newPwd').value;
	const rePwd = document.querySelector('input#rePwd').value;
	const btnSubmit = document.querySelector('button.btn_submit');
	const btnCancel = document.querySelector('button.btn_cancel');

	console.log(pwdConfirm);
	console.log(userPwd);
	console.log(btnSubmit);
	console.log(btnCancel);

	btnSubmit.addEventListener('click', () => {
		if (userPwd === inputPwd) {
			if (newPwd === rePwd) {
				alert('비밀번호 변경 완료');
				pwdForm.action = '/shape/myprofile';
				pwdForm.method = 'get';
				pwdForm.submit();
			} else {
				alert('영문, 특수문자와 숫자를 포함하여 최소 8자 이상 입력해주세요');
			}
		} else {
			alert('비밀번호가 일치하지 않습니다');
		}
	});
});