/**
 * infoFaq-detail.js
 * 우수빈 faq 관리자 삭제
 */

 document.addEventListener('DOMContentLoaded', function() {
	 
	 const form = document.querySelector('#faqDetailForm');
	 
	 const btnDelete = document.querySelector('button#btnFaqDelete');
	 
	 btnDelete.addEventListener('click', (e) => {
		 e.preventDefault();
		 
		 const fid = document.querySelector('input#fid').value;
		 
		 const result = confirm(`NO. ${fid} 삭제하시겠습니까?`);
		 
		 if(result) {
			 form.action = 'delete?fid='+fid;
			 form.method = 'post';
			 form.submit();
		 }
	 }); 
 });