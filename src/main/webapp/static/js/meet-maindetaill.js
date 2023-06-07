/**
 * 찜 참여완료 버튼
 */
const joinButton = document.querySelector('#join');
	joinButton.addEventListener('click', function() {
  	joinButton.textContent = '참여완료';
  	joinButton.disabled = true; // 클릭 비활성화
});