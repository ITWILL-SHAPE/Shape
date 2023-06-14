/**
 * 우수빈 notice 수정
 */

document.addEventListener('DOMContentLoaded', function() {
	
	const form = document.querySelector('#noticeModifyForm');
	
	const btnUpdate = document.querySelector('button#btnUpdateNotice');
	
	btnUpdate.addEventListener('click', (e) => {
		e.preventDefault();
		
		const title = document.querySelector('input#title').value;
		const content = document.querySelector('textarea#summernote').value;
		
		const nid = document.querySelector('input#nid').value;
		
		if(title === '' || content === '') {
			alert('내용을 입력하세요');
			return;
		}
		
		const result = confirm(`NO. ${nid} 변경 사항을 저장하시겠습니까?`);
		if(result) {
			form.action = 'update';
			form.method = 'post';
			form.submit();
		}
	});
});