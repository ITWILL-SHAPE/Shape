/**
 * myPosts.jsp 에서 사용
 */
document.addEventListener('DOMContentLoaded', () => {
  const deleteButton = document.querySelector('.delete-button');
  const allCheckbox = document.getElementById('all-checkbox');
  const rowCheckboxes = document.querySelectorAll('input[id="row-checkbox"]');

  allCheckbox.addEventListener('change', () => {
    const isChecked = allCheckbox.checked;

    rowCheckboxes.forEach((checkbox) => {
      checkbox.checked = isChecked;
    });
  });

  deleteButton.addEventListener('click', () => {
    const selectedPosts = [];
    rowCheckboxes.forEach((checkbox) => {
      if (checkbox.checked) {
        const commentAuthor = "drj9812";
        const commentTitle = checkbox.closest('tr').querySelector('.row-title').innerText;
        console.log(commentAuthor);
        console.log(commentContent);
        selectedComments.push({ author: commentAuthor, title: commentTitle });
        console.log(selectedComments);
      }
    });

    axios.post('/deletePosts', selectedPosts, {
      headers: {
        'Content-Type': 'application/json'
      }
    })
      .then((response) => {
        if (!response.data) {
          throw new Error('작성글 삭제에 실패했습니다.');
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