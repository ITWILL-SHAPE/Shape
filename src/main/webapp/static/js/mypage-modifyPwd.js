/**
 * modifyPwd.jsp에서 사용 
 */

document.addEventListener('DOMContentLoaded', function() {
	const updateBtn = document.querySelector('input#updateBtn');
	
	updateBtn.addEventListener('click', function() {
		checkForm();
	});
})

const checkForm = function() {

	const pwd = $('input[name="newPwd"]').val().trim();
	if (!checkPassword(pwd)) {
		alert('영문 대소문자, 숫자, 특수문자를 조합하여 최소 8자 이상으로 설정하셔야 합니다.');
		$('input[name="newPwd"]').focus();
		return false;
	}

}

// 비밀번호 유효성 체크
const checkPassword = function(pwd) {
	const regExp = /(?=.*\d{1,50})(?=.*[`~!@#\$%\^&\*\(\)\{\}\[\]\-_=\+\\|;:'"<>,\./\?]{1,50})(?=.*[a-zA-Z]{1,50}).{8,50}$/;
	return regExp.test(pwd);
};

