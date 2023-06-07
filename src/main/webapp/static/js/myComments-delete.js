/**
 * myComments.jsp에서 사용
 */
document.addEventListener('DOMContentLoaded', () => {
  const deleteButton = document.querySelector('.delete-button');
  const allCheckbox = document.getElementById('all-checkbox');
  const rowCheckboxes = document.querySelectorAll('input[id=row-checkbox]');

  allCheckbox.addEventListener('change', () => {
    const isChecked = allCheckbox.checked;

    rowCheckboxes.forEach((checkbox) => {
      checkbox.checked = isChecked;
    });
  });

  deleteButton.addEventListener('click', () => {
    const selectedComments = [];
    rowCheckboxes.forEach((checkbox) => {
      if (checkbox.checked) {
        const commentId = checkbox.getAttribute('data-id');
        const commentContent = checkbox.closest('tr').querySelector('.row-content').innerText;
        selectedComments.push({ id: commentId, content: commentContent });
      }
    });

    axios.post('/deleteComments', selectedComments, {
      headers: {
        'Content-Type': 'application/json'
      }
    })
      .then((response) => {
        if (!response.data) {
          throw new Error('댓글 삭제에 실패했습니다.');
        }
        // 삭제 작업 완료 후 처리할 내용
        location.reload(); // 페이지 새로고침
      })
      .catch((error) => {
        // 에러 발생 시 처리할 내용
        console.log('Error: ' + error);
      });
  });
});