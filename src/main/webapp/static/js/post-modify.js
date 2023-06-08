/**
 * post-modify
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
         const titleInput = document.querySelector('input#title').value; //input에 입력된 값
         const content = document.querySelector('textarea#summernote').value; //textarea에 입력된 값
         if(title === ''||content ===''){
             alert('제목과 내용은 반드시 입력하세요.')
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