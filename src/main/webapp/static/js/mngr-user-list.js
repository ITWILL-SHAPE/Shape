/**
 * 사용자 관리
 */

$(document).ready(function() {
	initPage();
	registEvent();
	setDefault();
	findAllAction();
});

const initPage = function() {
	// 데이트피커 초기화
	$('input[name="searchRegDateStart"]').datepicker({
		format : "yyyy-mm-dd",
		startView : 3,
		todayBtn : "linked",
		language : "kr",
		orientation : "top auto",
		keyboardNavigation : false,
		forceParse : false,
		autoclose : true,
		todayHighlight : true
	});

	$('input[name="searchRegDateEnd"]').datepicker({
		format : "yyyy-mm-dd",
		startView : 3,
		todayBtn : "linked",
		language : "kr",
		orientation : "top auto",
		keyboardNavigation : false,
		forceParse : false,
		autoclose : true,
		todayHighlight : true
	});
};


const setDefault = function() {
	const searchRegDateStart = null;
	const searchRegDateEnd = null;

	$('input[name="searchRegDateStart"]').datepicker('setDate', searchRegDateStart);
	$('input[name="searchRegDateEnd"]').datepicker('setDate', searchRegDateEnd);
};

const registEvent = function() {
	$('#btnSearch').on('click', function(e) {
		e.preventDefault();
		findAllAction();
	});
	
	$('#btnResetSearch').on('click', function(e) {
		e.preventDefault();
		if (confirm('검색을 초기화 할까요?')) {
			$(location).attr('href', 'list');
		}
	});
	
	$('input[name="searchId"]').on('keydown', function(e) {
		if (e.keyCode == 13) {
			e.preventDefault();
			findAllAction();
		}
	});
	
	$('input[name="searchPhone"]').on('keydown', function(e) {
		if (e.keyCode == 13) {
			e.preventDefault();
			findAllAction();
		}
	});
	
	$('input[name="searchEmail"]').on('keydown', function(e) {
		if (e.keyCode == 13) {
			e.preventDefault();
			findAllAction();
		}
	});
	
};

const findAllAction = function() {
	searchRegDateStart = $('input[name="searchRegDateStart"]').val();
	searchRegDateEnd = $('input[name="searchRegDateEnd"]').val();
	
	if (searchRegDateStart > searchRegDateEnd) {
		alert('검색 기간의 끝날짜가 시작날짜보다 빠릅니다.');
		$('input[name="searchRegDateEnd"]').focus();
		return;
	}
};
