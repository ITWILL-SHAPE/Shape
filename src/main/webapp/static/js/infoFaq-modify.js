/**
 * infoFaq-modify.js
 * 우수빈 faq 관리자 수정
 */

document.addEventListener('DOMContentLoaded', function() {
	
	const form = document.querySelector('#faqModifyForm');
	
	const btnUpdate = document.querySelector('button#btnFaqUpdate');
	
	btnUpdate.addEventListener('click', (e) => {
		e.preventDefault();
		
		const question = document.querySelector('input#question').value;
		const answer = document.querySelector('textarea#answer').value;
		
		if(question === '' || answer === '') {
			alert('내용을 입력하세요.');
			return;
		}
		
		const result = confirm(`NO. ${fid} 변경 사항을 저장하시겠습니까?`);
		if(result) {
			form.action = 'update'; // 폼 요청 주소 (./update)
			form.method = 'post';
			form.submit();
		}
	});
	
});