/**
 * infoQnA-modify.js
 * 
 */
document.addEventListener('DOMContentLoaded', () => {
    const modifyForm = document.querySelector('#modifyForm');
    const btnDelete = document.querySelector('#btnDelete');
    const qid = document.querySelector('#qid').value;
    btnDelete.addEventListener('click', () => {
        const check = confirm('정말 삭제할까요?');
        if(check){
            modifyForm.action = './delete?qid='+ qid; 
            modifyForm.method = 'post'; 
            modifyForm.submit(); 
        }
    })
});