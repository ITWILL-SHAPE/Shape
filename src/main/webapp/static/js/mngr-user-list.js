/**
 * 사용자 관리
 */

$(document).ready(function() {
	initPage();
	registEvent();
	setDefault();
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
	/*
	$('#btnSearch').on('click', function(e) {
		e.preventDefault();
		findAllAction();
	});
	*/
	
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
	
	const searchId = $('input[name="searchId"]').val().trim();
	const searchPhone = $('input[name="searchPhone"]').val().trim();
	const searchEmail = $('input[name="searchEmail"]').val().trim();
	
	let data = {
		searchId : searchId,
		searchPhone : searchPhone,
		searchEmail : searchEmail,
		searchRegDateStart : searchRegDateStart,
		searchRegDateEnd : searchRegDateEnd
	};
	
	console.log(data);
	
	
	searchForm.submit();
	
	/*
	axios.post('/shape/mngr/user/list', data)
	.then((res) => {		
		let list = res.data;
		let html = '';
		let count = 1;
		
		if(list.length <= 0) {
			html += '<tr><td class="text-center align-middle" colspan="5">데이터가 없습니다.</td></tr>'
		}
		
		for (let user of list) {
			let phone = '';
			if(user.phone.includes('-')) {
				phone = user.phone;
			} else {
				phone = user.phone.substr(0, 3) + '-'
						+ user.phone.substr(3, 7) + '-'
						+ user.phone.substr(7, 13);
			}
			
			let join = user.join_date.substr(0, 10);
			
					
			html += `
					<tr onClick="location.href='/shape/mngr/user/detail?id=${ user.id }'">
						<td>${ count }</td>
						<td>${ user.id }</td>
						<td>${ user.name }</td>
						<td>${ phone }</td>
						<td>${ join }</td>
					</tr>
			`;
			
			count += 1;
		}
		
		$('tbody#userList').html(html);
	})
	.catch((err) => {
		console.log(err);
	})
	*/
};
