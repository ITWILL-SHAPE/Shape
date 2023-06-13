/**
 * pwd-confirm.js
 * /mypage/memberinfo/confirmPwd.jsp 에서 사용
 */
document.addEventListener('DOMContentLoaded', () => {
    const btnConfirm = document.querySelector('input.btn_login');

    btnConfirm.addEventListener('click', async (e) => {
        e.preventDefault();

        const inputPwd = document.querySelector('input#inputPwd').value;
        console.log(inputPwd);
		
        try {
            const response = await axios.post('/shape/confirmpwd', inputPwd);
            //왜 안돼?
            //const response = await axios.post('/shape/confirmpwd', { params: { inputPwd } });
            // 위 코드처럼 보내면 content-type이 application/x-www-form-urlencoded
            
            //axios.post 메서드는 기본적으로 Content-Type을 application/json으로 설정
            console.log(response);
            const isMatched = response.data;

            if (isMatched) {
				//GET 방식
                window.location.href = '/shape/modifypwdpage';
            } else {
                alert('비밀번호가 일치하지 않습니다.');
            }
        } catch (error) {
            console.error(error);
        }
    });
});