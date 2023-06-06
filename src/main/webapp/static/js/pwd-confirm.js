/**
 * pwd-confirm.js
 * /mypage/memberinfo/confirmPwd.jsp 에서 사용
 */
document.addEventListener('DOMContentLoaded', () => {
    const pwdForm = document.querySelector('.pwd_form');
    const inputPwd = document.querySelector('input#inputPwd').value;
    const userPwd = document.querySelector('input#userPwd').value;
    console.log(userPwd);

    const btnConfirm = document.querySelector('button.btn_confirm');

    btnConfirm.addEventListener('click', () => {
        if (inputPwd === userPwd) {
            pwdForm.action = '/shape/modifypwd';
        } else {
            pwdForm.action = '/shape/confirmpwd'; // 수정된 경로로 변경
        }
        pwdForm.method = 'post';
        pwdForm.submit();
    });
});