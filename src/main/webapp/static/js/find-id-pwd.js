/**
 * findIdOrPwd.js
 */

$(document).ready(function() {
	initPage();
	registEvent();
	setDefault();
});

let code = '';
let user = '';

//페이지 초기화
const initPage = function() {
	
};

// 기본값 세팅
const setDefault = function() {
	$('.message').hide();
};

// 이벤트 등록
const registEvent = function() {
	// tab 변경 시 input 박스 비우기
	$("ul.nav li.nav-item").click(function() {
		$("#tabContent *").find("input").val('');
		$("#tabContent *").find("input").attr("readonly",false);
		// select 박스 초기화
		$('select[name="emailAddress"]').find('option:first').prop('selected', true);
		$('input[name="emailId"]').attr("type", "text");
		// 인증번호 box display none
		$('#findIdCode').hide();
		$('.message').hide();
		// 아이디 박스
		$('#yourId').hide();
	});
	
	// 인증번호 발송 클릭
	$('#sendCode').click(function() {
		findUser();
		// getSendEmail();
	});
	
	// 비밀번호 찾기 인증번호 발송
	$('#sendCodePwd').click(function() {
		findUser();
	});
	
	// blur -> focus가 벗어나는 경우 발생
	$('input[name="codeId"]').blur(function() {
		compareCodeId();
	});
	
	$('input[name="codePwd"]').blur(function() {
		compareCodeId();
	});
	
	// 이메일 주소 직접 입력 확인
	$('select[name="emailAddress"]').change(function() {
		console.log($(this).val());
		if($(this).val() == 'self') {
			$('input[name="emailId"]').attr("type", "email");
			
		} else {
			$('input[name="emailId"]').attr("type", "text");
		}
	});
	
}

// 인증번호 클릭 시 빈 박스 확인
const checkForm = function() {
	let selectTab = $('ul#findTab li.nav-item button.active').attr('id');
	// console.log(selectTab);
	
	// ID 찾기
	if(selectTab == 'findId-tab') {
		let name = $('div#findId input[name="name"]').val().trim();
		if(name.length == 0) {
			alert('이름을 입력해주세요.');
			$('input[name="name"]').focus();
			return false;
		}
		
		// selectbox가 직접입력이 눌려있을 경우
		if($('div#findId input[name="emailId"]').attr("type") == 'email') {
			let emailId = $('div#findId input[name="emailId"]').val().trim();
			if(!checkEmail(emailId)) {
				alert('올바른 이메일을 입력해주세요.');
				$('input[name="email"]').focus();
				return false;
			}
		} else {
			let emailId = $('div#findId input[name="emailId"]').val().trim();
			if(emailId.length == 0) {
				alert('이메일을 입력해주세요.');
				$('input[name="emailId"]').focus();
				return false;
			}
			
			let emailAddress = $('div#findId select[name="emailAddress"]').val();
			if(emailAddress.length == 0) {
				alert('이메일 주소를 선택해주세요.');
				$('input[name="emailAddress"]').focus();
				return false;
			}
		}	
		
	} else { // PWD 찾기
		let id = $('input[name="id"]').val().trim();
		if(id.length == 0) {
			alert('ID를 입력해주세요.');
			$('input[name="id"]').focus();
			return false;
		}
	
		let name = $('div#findPwd input[name="name"]').val().trim();
		if(name.length == 0) {
			alert('이름을 입력해주세요.');
			$('input[name="name"]').focus();
			return false;
		}
		
		// selectbox가 직접입력이 눌려있을 경우
		if($('div#findPwd input[name="emailId"]').attr("type") == 'email') {
			let emailId = $('div#findPwd input[name="emailId"]').val().trim();
			if(!checkEmail(emailId)) {
				alert('올바른 이메일을 입력해주세요.');
				$('input[name="email"]').focus();
				return false;
			}
		} else {
			let emailId = $('div#findPwd input[name="emailId"]').val().trim();
			if(emailId.length == 0) {
				alert('이메일을 입력해주세요.');
				$('input[name="emailId"]').focus();
				return false;
			}
			
			let emailAddress = $('div#findPwd select[name="emailAddress"]').val();
			if(emailAddress.length == 0) {
				alert('이메일 주소를 선택해주세요.');
				$('input[name="emailAddress"]').focus();
				return false;
			}
		}			
	}
	
	return true;
}

// 입력한 아이디, 이메일, 이름에 해당하는 유저가 있는지 확인
const findUser = function() {
	if(!checkForm()) return;
	
	let selectTab = $('ul#findTab li.nav-item button.active').attr('id');
	// console.log(selectTab);
	
	let data = {};
	// ID 찾기
	if(selectTab == 'findId-tab') {
		let name = $('div#findId input[name="name"]').val().trim();
		let email = '';
		if($('div#findId input[name="emailId"]').attr("type") == 'email') {
			email = $('div#findId input[name="emailId"]').val().trim();
		} else {
			let emailId = $('div#findId input[name="emailId"]').val().trim();
			let emailAddress = $('div#findId select[name="emailAddress"]').val();
			email = emailId + emailAddress
		}
		
		data = {
			id : null,
			name : name,
			email : email
		};
		
	} else {
		let id = $('input[name="id"]').val().trim();
		let name = $('div#findPwd input[name="name"]').val().trim();
		let email = '';
		if($('div#findPwd input[name="emailId"]').attr("type") == 'email') {
			email = $('div#findPwd input[name="emailId"]').val().trim();
		} else {
			let emailId = $('div#findPwd input[name="emailId"]').val().trim();
			let emailAddress = $('div#findPwd select[name="emailAddress"]').val();
			email = emailId + emailAddress
		}
		
		data = {
			id : id,
			name : name,
			email : email
		};
	}
	
	console.log(data);
	axios.post('/shape/member/findUser', data)
	.then((res) => {
		console.log(res.data);
		if(res.data == 0) {
			alert('입력하신 정보와 일치하는 사용자가 없습니다.');
			return;
		} else {
			// alert('있다!!');
			getSendEmail(data);			
			// 나중에 인증번호 보내는 함수 콜
			// return;
		}
	})
	.catch((err) => {
		console.log(err);
		alert('사용자 검색 오류');
	})
}

//이메일 유효성 체크
const checkEmail = function(email) {
	const emailRegExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	if (email.match(emailRegExp) == null) {
		return false;
	}
	return true;
};

// 인증번호 이메일 전송
const getSendEmail = function(data) {
	user = {
		id : data.id,
		name : data.name,
		email : data.email
	};
	
	let reqUrl = '/shape/member/mailCheck/' + data.email;
	// console.log(reqUrl);
	
	code = '';
	
	axios.get(reqUrl)
	.then ((response) => {
		console.log(response.data);
		code = response.data;
		
		let selectTab = $('ul#findTab li.nav-item button.active').attr('id');
		if(selectTab == 'findId-tab') {
			$('#findIdCode').show();
		} else {
			$('#findPwdCode').show();
		}
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
	const inputCodePwd = $('input[name="codePwd"]').val();
	console.log(inputCode);
	console.log(inputCodePwd);
	console.log('code = ' + code);
	$('.message').html('');
	
	
	if(inputCode == code) {
		$('.message').html('인증번호가 일치합니다.');
		$('.message').css('color', 'green');		
		$('.message').show();
		$('input[name="codeId"]').attr("readonly",true);
		showUserId();
		return;
	} else {
		$('.message').html('인증번호가 불일치합니다.');
		$('.message').css('color', 'red');
	}
	
	if(inputCodePwd == code) {
		$('.message').html('인증번호가 일치합니다.');
		$('.message').css('color', 'green');		
		$('.message').show();
		$('input[name="codeId"]').attr("readonly",true);
		randomPwd();
		return;
	} else {
		$('.message').html('인증번호가 불일치합니다.');
		$('.message').css('color', 'red');
		$('.message').show();
	}
}


// 아이디 노출
const showUserId = function() {
	axios.post('/shape/member/findUserId', user)
	.then((res) => {
		console.log(res.data);
		$('#yourId').html('아이디는 ' + res.data + ' 입니다.');
		$('#yourId').show();
	})
}

const randomPwd = function() {
	axios.post('/shape/member/randomPwd', user)
	.then((res) => {
		console.log(res.data);
		$('.message').html(`임시 비밀번호가 발급되었습니다.<br>이메일을 확인해주세요.`);
	})
	.catch((error) => {
		alert(`임시 비밀번호 생성에 문제가 생겼습니다.<br>관리자에게 문의주세요.`);
	})
}


