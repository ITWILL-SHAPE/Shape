/**
 * 수빈 댓글 기능 js
 */

document.addEventListener('DOMContentLoaded', () => {
	
	
	/*const comments = document.querySelector('div#comments'); // 댓글 목록 표시 영역(div)
	
	const getCommentWithPid = async () => {
		
		const pid = document.querySelector('input#pid').value;
		
		const reqUrl = `/shape/comment/all/{pid}`;
		
		try {
			const response = await axios.get(reqUrl);
			console.log(response);
			
			//TODO: 댓글 개수 업데이트 $ 댓글 목록 보여주기
			//makeCommentElements(response.data);
		} catch(error) {
			console.log(error);
		}
	}; */
	
	// TODO: 댓글 목록 HTML을 작성하고 replies 영역에 추가하는 함수
    // argument data: Ajax 요청의 응답으로 전달받은 데이터
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 댓글 등록 버튼
	const btnAddComment = document.querySelector('button#btnAddComment');
	
	const createComment = (e) => {
		
		const pid = document.querySelector('input#pid').value; // 해당 게시글 id 왜 안됨
		
		const content = document.querySelector('textarea#content').value;
		const author = document.querySelector('input#author').value;
		
		if (content ==='') {
			alert('댓글 작성');
			return;
		}
		
		const data = { pid, content, author };
		
		axios.post('/shape/comment', data)
			.then((response) => {
				alert(`댓글 등록 성공 (${response.data})`);
				
				// 댓글 입력 창의 내용 지움
				document.querySelector('textarea#content').value = '';
				
				// TODO: 댓글 목록 새로고침
				
			}) // 성공 응답이 왔을 때 실행 할 callback 함수 등록
			.catch((error) => {
				console.log(error);
			});
	};
	btnAddComment.addEventListener('click', createComment); // 함수를 외부에서 만드는 방법. callback 함수
	
});



 