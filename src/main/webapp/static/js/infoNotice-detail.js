/**
 * 
 */

document.addEventListener('DOMContentLoaded', function() {
	
	const form = document.querySelector('#noticeDetailFrom');
	
	const btnDelete = document.querySelector('button#btnDeleteNotice');
	
	btnDelete.addEventListener('click', (e) => {
		e.preventDefault();
		
		const nid = document.querySelector('input#nid').value;
		
		const result = confirm(`삭제하시겠습니까?`);
		
		if(result) {
			form.action = 'delete?nid='+nid;
			form.method = 'post';
			form.submit();
		}
		
	});
	
}); 