/**
 * pwd-confirm.js
 * /mypage/memberinfo/confirmPwd.jsp 에서 사용
 */
document.addEventListener('DOMContentLoaded', () => {
    const confirmPwdForm = document.querySelector('.confirmPwd_form');
    const btnConfirm = document.querySelector('input.btn_login');

    btnConfirm.addEventListener('click', async (e) => {
        e.preventDefault();

        const inputPwd = document.querySelector('input#inputPwd').value;
        console.log(inputPwd);
	
		//let data = { id: "test", inputpwd: inputPwd};
		
        try {
            const response = await axios.post('/shape/confirmpwd', { inputPwd });
            //const response = await axios.post('/shape/confirmpwd', { data });
            console.log(response);
            const isMatched = response.data;

            if (isMatched) {
                window.location.href = '/modifyPwd';
            } else {
                alert('비밀번호가 일치하지 않습니다.');
            }
        } catch (error) {
            console.error(error);
        }
    });
});