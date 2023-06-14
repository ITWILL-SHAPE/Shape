/**
 * signUp
 */

$(document).ready(function() {
	initPage();
	registEvent();
	setDefault();
});

//페이지 초기화
const initPage = function() {
	// 데이트피커 초기화
	$('input[name="birth"]').datepicker({
		format: "yyyy-mm-dd",
		startView: 3,
		todayBtn:"linked",
		language: "kr",
		orientation: "top auto",
		keyboardNavigation: false,
		forceParse: false,
		autoclose: true,
		todayHighlight: true,
		changeMonth: true,
		changeYear: true,
		maxDate: "D",
		nextText: '다음 달',
		prevText: '이전 달'
	});
}

// 기본값 세팅
const setDefault = function() {

};

// 이벤트 등록
const registEvent = function() {
	$('input[name="id"]').on('change keydown', function() {
		$('#idDupCheck').val('N');
		$('#btnIdDupCheck').prop('disabled', false);
	});
	
	$('#btnIdDupCheck').click(function() {
		checkIdDup();
	});
	
	
	const signUpBtn = document.querySelector('#signUpBtn');
	signUpBtn.addEventListener('click', (e) => {
		e.preventDefault();
		registUser();
	});
}

const checkForm = function() {
	const id = $('input[name="id"]').val().trim();
	if(!checkId(id)) {
		alert('ID를 4~12자 이내의 숫자와 영문소문자로 입력해주세요.');
		$('input[name="id"]').focus();
		return false;
	}
	
	const idDupCheck = $('#idDupCheck').val();
	if (idDupCheck == 'N') {
		alert('아이디 중복을 확인해주세요.');
		$('input[name="id"]').focus();
		return false;
	}
	
	const pwd = $('input[name="pwd"]').val().trim();
	if(!checkPassword(pwd)) {
		alert('영문 대소문자, 숫자, 특수문자를 조합하여 최소 8자 이상으로 설정하셔야 합니다.');
		$('input[name="pwd"]').focus();
		return false;
	}
	
	const name = $('input[name="name"]').val().trim();
	if(name.length == 0) {
		alert('이름을 입력해주세요.');
		$('input[name="name"]').focus();
		return false;
	}
	
	const gender = $('input[name="gender"]:checked').val();
	if(!gender) {
		alert('성별을 선택해주세요.');
		$('input[name="gender"]:radio[value="M"]').focus();
		return false;
	}
	
	const birth = $('input[name="birth"]').val();
	if(birth.length == 0) {
		alert('생년월일을 선택해주세요.');
		$('input[name="birth"]').focus();
		return false;
	}
	
	const phone = $('input[name="phone"]').val();
	if(phone.length == 0) {
		alert('휴대폰 번호를 입력해주세요.');
		$('input[name="phone"]').focus();
		return false;
	}
	
	if(phone.length < 13) {
		alert('정확한 휴대폰 번호를 입력해주세요.');
		$('input[name="phone"]').focus();
		return false;
	}
	
	const email = $('input[name="email"]').val();
	if(!checkEmail(email)) {
		alert('올바른 이메일을 입력해주세요.');
		$('input[name="email"]').focus();
		return false;
	}
	
	return true;
}

const registUser = function() {
	if(!checkForm()) return;
	
	const id = $('input[name="id"]').val().trim();
	const pwd = $('input[name="pwd"]').val().trim();
	const name = $('input[name="name"]').val().trim(); 
	const gender = $('input[name="gender"]:checked').val(); 
	const birth = $('input[name="birth"]').val();
	const phone = $('input[name="phone"]').val();
	const email = $('input[name="email"]').val();
	
	
	const data = {id, pwd, name, gender, birth, phone, email};
	console.log(data);
	const reqUrl = `/shape/member/signUp`;
	axios.post(reqUrl, data)
	.then((response) => {
		console.log(response);
		alert('회원가입 성공');
		$(location).attr('href', 'signUpSuccess');
	})
	.catch((error) => {
		console.log(error);
		alert('회원가입 오류');
	});
}

//전화번호 형식 자동 변환
const checkPhone = (target) => {
	target.value = target.value
		.replace(/[^0-9]/g, '')
		.replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
}

// 아이디 중복 체크
const checkIdDup = function() {
	const id = $('input[name="id"]').val();
	if (!checkId(id)) {
		alert('ID를 4~12자 이내의 숫자와 영문소문자로 입력해주세요');
		$('input[name="id"]').focus();
		return;
	}
	
	console.log(id);
	axios.post(`/shape/member/idDupCheck/${id}`)
	.then((response) => {
		console.log(response.data);
		if(response.data == 0) {
			alert('사용할 수 있는 아이디입니다.');
			$('#idDupCheck').val(id);
			$('#btnIdDupCheck').prop('disabled', true);
		} else {
			alert('이미 사용중인 아이디입니다.');
		}		
	})
	.catch((error) => {
		console.log(error);
		alert('아이디 중복체크 오류');
	});
	
};

// 아이디 유효성 체크
const checkId = function(id) {
	const regExp = /^[a-z0-9]{4,12}$/;
	return regExp.test(id);
};

// 비밀번호 유효성 체크
const checkPassword = function(pwd) {
	const regExp = /(?=.*\d{1,50})(?=.*[`~!@#\$%\^&\*\(\)\{\}\[\]\-_=\+\\|;:'"<>,\./\?]{1,50})(?=.*[a-zA-Z]{1,50}).{8,50}$/;
	return regExp.test(pwd);
};

//이메일 유효성 체크
const checkEmail = function(email) {
	const emailRegExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	if (email.match(emailRegExp) == null) {
		return false;
	}
	return true;
};
