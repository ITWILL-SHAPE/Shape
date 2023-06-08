/**
 * findIdOrPwd.js
 */

$(document).ready(function() {
	initPage();
	registEvent();
	setDefault();
});

//페이지 초기화
const initPage = function() {
	
};

// 기본값 세팅
const setDefault = function() {
	
};

// 이벤트 등록
const registEvent = function() {
	$('#sendCodeFindId').click(function() {
		checkForm();
		getSendEmail();
	});
	
	$('#sendCodefindPwd').click(function() {
		checkForm();
		getSendEmail();
	});
	
	// blur -> focus가 벗어나는 경우 발생
	$('#codeId').blur(function() {
		compareCodeId();
	});
	
}

/*
const getSendEmail = async () => {
	const eamil = $('#userEmail1').val() + $('#userEmail2').val(); // 이메일 주소값 얻어오기!
	console.log('완성된 이메일 : ' + eamil); // 이메일 오는지 확인
	const checkInput = $('.mail-check-input') // 인증번호 입력하는곳 
	
	const reqUrl = '/shape/member/mailCheck/' + eamil;
	console.log(reqUrl);
	
	try {
		const response = await axios.get(reqUrl);
		console.log(response.data);
		checkInput.attr('disabled', false);
		code = response.data;
		alert('인증번호가 전송되었습니다.');	
	} catch (error) {
		console.log(error);
		alert('인증번호 발송 오류');
	}
}
*/

// 인증번호 이메일 전송
const getSendEmail = function() {
	const email = $('input[name="email"]').val();
	
	const reqUrl = '/shape/member/mailCheck/' + email;
	console.log(reqUrl);
	
	axios.get(reqUrl)
	.then ((response) => {
		console.log(response.data);
		$('#findIdCode').css("display");
		const code = response.data;
		alert('인증번호가 전송되었습니다.');
	})
	.catch((error) => {
		console.log(error);
		alert('인증번호 발송 오류');
	});
}

// 인증번호 비교 
const compareCodeId = function() {
	const inputCode = $('input[name="codeId"]').val();
	const errorMsg = $('.errorMessage');
	const yourId = $('#yourId');
	
	if(inputCode == code) {
		$('#yourId')
	}
	
}



