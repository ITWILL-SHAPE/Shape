/**
 * post-detail 지현 
 */
 document.addEventListener('DOMContentLoaded', () => {
     const modifyForm = document.querySelector('#modifyForm');
     
     const pid = document.querySelector('#pid').value;
     const btnDelete = document.querySelector('#btnDelete');
     btnDelete.addEventListener('click', () => {
         const check = confirm('정말 삭제할까요?');
         if(check){
             modifyForm.action = './delete?pid=' + pid;
             modifyForm.method = 'post'; 
             modifyForm.submit(); 
         }
     })
 });