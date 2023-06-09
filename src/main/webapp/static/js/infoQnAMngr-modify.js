/**
 * infoQnAMngr-modify
 * 지현 QnA 수정 
 */
document.addEventListener('DOMContentLoaded', () => {
     const modifyForm = document.querySelector('#modifyForm');
     
     const btnUpdate = document.querySelector('#btnUpdate');
     btnUpdate.addEventListener('click', () =>{
         // 제목과 내용이 입력되어 있는 지 체크
         const title = document.querySelector('input#an_title').value; //input에 입력된 값
         const qid = document.querySelector('input#qid').value;
         const content = document.querySelector('textarea#an_comment').value; //textarea에 입력된 값
         if(title === ''||content ===''){
             alert('제목과 내용은 반드시 입력하세요.')
             return;
         }
         const check = confirm('변경 내용을 저장할까요?')
         if(check){
             modifyForm.action = './update?qid=' + qid;
             modifyForm.method = 'post';
             modifyForm.submit();
         }
     })
 });