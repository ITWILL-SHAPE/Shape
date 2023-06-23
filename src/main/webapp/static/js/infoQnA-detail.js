/**
 * infoQnA-detail.js
 * 지현 qna 삭제
 */
document.addEventListener('DOMContentLoaded', () => {
    const modifyForm = document.querySelector('#modifyForm');
    const btnDelete = document.querySelector('#btnDelete');
    const qid = document.querySelector('#qid').value;
    btnDelete.addEventListener('click', () => {
        const check = confirm('삭제하시겠습니까?');
        if(check){
            modifyForm.action = './delete?qid='+ qid; 
            modifyForm.method = 'post'; 
            modifyForm.submit(); 
        }
    })
});