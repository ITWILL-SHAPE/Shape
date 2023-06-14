/**
 * mngr-sidebar.js
 */
// 오류날게 뻔하지만 내 한계인 js
document.addEventListener('DOMContentLoaded', function() {
	let url = window.location.pathname;
	console.log(url);
	/*
	if($('#sideBar').find('li a[href="' + url + '"]').parent().parent().val() == 0) {
		// console.log('있다!');
		$('#sideBar').find('li a[href="' + url + '"]').parent().parent().parent().addClass('show');
		$('#sideBar').find('li a[href="' + url + '"]').parent().parent().addClass('show');
		$('#sideBar').find('li a[href="' + url + '"]').parent().addClass('active');
	} else {
		$('#sideBar').find('li a[href="' + url + '"]').addClass('active');
	}
	*/
	$('#sideBar').find('li a[href="' + url + '"]').parent().parent().parent().addClass('show');
	$('#sideBar').find('li a[href="' + url + '"]').parent().parent().addClass('show');
	$('#sideBar').find('li a[href="' + url + '"]').parent().addClass('active');
	$('#sideBar').find('li a[href="' + url + '"]').addClass('active');
});
