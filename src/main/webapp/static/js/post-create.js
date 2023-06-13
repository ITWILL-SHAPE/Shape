/**
 * 게시판 지현
 * post-create
 * create
 * modify
 */
document.addEventListener('DOMContentLoaded', () => {
	
		let select = document.getElementById('select');
		select.addEventListener('change', function(){
			document.getElementById('hrs_hd').innerHTML
			= select.options[select.selectedIndex].value;
			
		})
		
		const btnPostCreate = document.querySelector('button#btnPostCreate');
		const createForm = $('#createForm');
		
		btnPostCreate.addEventListener('click', function() {
			const hrs_hd = document.querySelector('textarea#hrs_hd').value;
			const title = document.querySelector('input#title').value;
			const content = document.querySelector('textarea#summernote').value;
			const trimTitle = title.trim();
			
			let replaceContent = content.replace(/&nbsp;/gi, "");
		    replaceContent = replaceContent.replace(/<br>/gi, "");
		    replaceContent = replaceContent.replace(/ /gi, "");
			
			console.log('내용: ', replaceContent, trimTitle);
			
			if (!hrs_hd) {
				alert('말머리를 선택하세요');
				return;
			}
			
			if (!trimTitle || replaceContent == "<p><\/p>" || replaceContent == "") {
			 alert('내용을 입력하세요');
			 return;
		   }
			
			createForm.submit();
		});
		
		
		
		
		
		
		
});