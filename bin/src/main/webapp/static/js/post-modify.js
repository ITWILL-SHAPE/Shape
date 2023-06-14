/**
 * post-modify 지현 
 */
const hrs_hd = document.querySelector('#hrs_hd').value;
$("#select").val(hrs_hd);

/* 수정 버튼 */
 document.addEventListener('DOMContentLoaded', () => {
     const modifyForm = document.querySelector('#modifyForm');
     const pid = document.querySelector('#pid').value;
     const btnUpdate = document.querySelector('#btnUpdate');
     
     
     btnUpdate.addEventListener('click', () =>{
         // 제목과 내용이 입력되어 있는 지 체크
         const hrs_hd = document.querySelector('textarea#hrs_hd').value;
         const title = document.querySelector('input#title').value; //input에 입력된 값
         const content = document.querySelector('textarea#summernote').value; //textarea에 입력된 값
		 const trimTitle = title.trim();
		 
		 let replaceContent = content.replace(/&nbsp;/gi, "");
		 replaceContent = replaceContent.replace(/<br>/gi, "");
		 replaceContent = replaceContent.replace(/ /gi, "");
		 
         
		 if (!hrs_hd) {
			 alert('말머리를 선택하세요');
			 return;
		 }
		 
		 console.log('내용: ', replaceContent, trimTitle);
		 
		 if (!trimTitle || replaceContent == "<p><\/p>" || replaceContent == "") {
			 alert('내용을 입력하세요');
			 return;
		 }
         
         const check = confirm('변경 내용을 저장할까요?')
         if(check){
             modifyForm.action = './update?pid=' + pid;
             modifyForm.method = 'post';
             modifyForm.submit();
         }
     })
 });