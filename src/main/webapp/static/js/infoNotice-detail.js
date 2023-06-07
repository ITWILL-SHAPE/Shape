/**
 * 
 */

document.addEventListener('DOMContentLoaded', function() {
	
	const form = document.querySelector('#noticeDetailFrom');
	
	const btnDelete = document.querySelector('button#btnDeleteNotice');
	
	btnDelete.addEventListener('click', (e) => {
		e.preventDefault();
		
		const nid = document.querySelector('input#nid').value;
		
		const result = confirm(`NO. ${nid} 삭제?`);
		
		if(result) {
			form.action = 'delete';
			form.method = 'post';
			form.submit();
		}
		
	});
	
}); 