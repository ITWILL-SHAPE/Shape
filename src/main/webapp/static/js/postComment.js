/**
 * 수빈 댓글 기능 js
 */

document.addEventListener('DOMContentLoaded', () => {
	
	const comments = document.querySelector('div#comments'); // 댓글 목록 표시 영역(div)
	const commentCountSpan = document.querySelector('span#commentCount'); // 댓글 개수 표시 영역(span)
	
	// 댓글 목록 HTML을 작성하고 comments 영역에 추가하는 함수
	const makeCommentElements = (data) => { // argument data: Ajax 요청의 응답으로 전달받은 데이터
		
		commentCountSpan.innerHTML = data.length; // 댓글 개수 업데이트
		
		comments.innerHTML = ''; // <div>의 컨텐트를 지움	
		
		let htmlStr = ''; // 문자열을 계속 덧붙이려고 let으로 설정
		
		for(let comment of data) {
			
			// Timestamp 타입 값을 날짜/시간 타입 문자열로 변환:
            const modified = new Date(comment.modifiedDate).toLocaleString();
			// 댓글 1개를 표시할 HTML 코드:
            htmlStr += `
                <div class="card" id="${comment.pcid}">
                
	                    <div>
	                        <span class="d-none">${comment.pcid}</span>
	                        <span class="fw-bold">${comment.author}</span>
	                        <span class="text-secondary">${modified}</span>
	                    </div>
                    
                    <div id="modifyContent${comment.pcid}">
	                    <div id="text${comment.pcid}">
	                        ${comment.content}
	                    </div>   
	                    <div class="d-grid gap-2 d-md-flex justify-content-md-end">
	                        <button class="btnDelete btn btn-outline-danger" data-id="${comment.pcid}">
	                            삭제
	                        </button>
	                        <button class="btnModify btn btn-outline-success" data-id="${comment.pcid}">
	                            수정
	                        </button>
	                    </div>  
                    </div>  
                             
                </div>
            `; 
		}
		comments.innerHTML = htmlStr; // 작성된 HTML 코드를 comments <div> 영역 안에 포함.
		
		// 모든 삭제 버튼들을 찾아서 클릭 이벤트 리스너를 등록:
        const deleteButtons = document.querySelectorAll('button.btnDelete');
        for (let btn of deleteButtons) {
            btn.addEventListener('click', deleteComment);
        }
        
        //모든 수정 버튼들을 찾아서 클릭 이벤트 리스너를 등록:
        //TODO: 수정 완료 버튼 이벤트
        const modifyButtons = document.querySelectorAll('button.btnModify');
        for (let btn of modifyButtons) {
			btn.addEventListener('click', showUpdateDiv);
		}
		
	}; //makeCommentElements end.
	
	const updateDiv = document.querySelector('div#modifyContent').innerHTML;
	//const updateDiv = document.getElementById("updateDiv").style.display;
	const updateDivPcid = document.querySelector('input#updateDivPcid');
	const updateDivText = document.querySelector('textarea#updateDivText');
	const btnUpdateDiv = document.querySelector('button#btnUpdateDiv');
	
	// 댓글 수정 버튼의 이벤트 리스너 (콜백) 함수
	const showUpdateDiv = (e) => {
		
		const pcid = e.target.getAttribute('data-id');
		const reqUrl = `/shape/comment/${pcid}`;
		
		console.log('updateDivPcid' + updateDivPcid);
		
		axios.get(reqUrl)
			.then((response) => {
				const { pcid, content } = response.data;
				
				updateDivPcid.value = pcid;
				updateDivText.value = content;
				console.log(pcid, content);
				
				console.log('updateDivPcid' + updateDivPcid.value);
				console.log('updateDivText' + updateDivText.value);
				
			    const contentText = content;
				console.log(contentText);
				const modifyContent = document.querySelector('div#modifyContent' + pcid);
				//document.getElementById("updateDiv").style.display = 'block';
				modifyContent.innerHTML = updateDiv; // div 보이기
				console.log(updateDiv);
				console.log('axios:get ' + reqUrl); 
			})
			.catch((error) => console.log(error)); 
	};
	
	const updateComment = (e) => {
		const pcid = updateDivPcid.value;		
		const content = updateDivText.value;
		console.log(pcid, content);
		
		const reqUrl = `/shape/comment/${pcid}`;
		const data = { content };
		
		axios.put(reqUrl, data)
			.then((response) => {
				alert('수정 성공');
				getCommentWithPid();
			})
			.catch((error) => console.log(error))
			//.finally(() => document.getElementById('modifyContent').style.display = "none"); // div 숨기기
	};
	btnUpdateDiv.addEventListener('click', updateComment);
	
	
	
	
	/*// jsp에 div 따로 만든 것들 element -> 됨
	const updateDiv = document.querySelector('div#modifyContent');
	const updateDivPcid = document.querySelector('input#updateDivPcid');
	const updateDivText = document.querySelector('textarea#updateDivText');
	const btnUpdateDiv = document.querySelector('button.btnUpdateDiv');
	
	// 댓글 수정 버튼의 이벤트 리스너 (콜백) 함수
	const showUpdateDiv = (e) => {
		
		const pcid = e.target.getAttribute('data-id');
		const reqUrl = `/shape/comment/${pcid}`;
		
		axios.get(reqUrl)
			.then((response) => {
				const { pcid, content } = response.data;
				
				updateDivPcid.value = pcid;
				updateDivText.value = content;
				
				document.getElementById('modifyContent').style.display = "block"; // div 보이기
			})
			.catch((error) => console.log(error)); 
	};
	
	const updateComment = (e) => {
		const pcid = updateDivPcid.value;		
		const content = updateDivText.value;
		
		const reqUrl = `/shape/comment/${pcid}`;
		const data = { content };
		
		axios.put(reqUrl, data)
			.then((response) => {
				alert('수정 성공');
				getCommentWithPid();
			})
			.catch((error) => console.log(error))
			.finally(() => document.getElementById('modifyContent').style.display = "none"); // div 숨기기
	};
	btnUpdateDiv.addEventListener('click', updateComment);*/

	// 댓글 삭제 버튼의 이벤트 리스너 (콜백) 함수
	const deleteComment = (e) => { 
		console.log(e.target);
		if(!confirm('삭제?')) {
			return;
		}
		const pcid = e.target.getAttribute('data-id'); // 삭제할 댓글 아이디
		const reqUrl = `/shape/comment/${pcid}`; // 삭제 요청 url
		
		axios.delete(reqUrl)
			.then((response) => {
				console.log(response);
				getCommentWithPid(); // 댓글 목록 갱신
			})
			.catch((error) => {
				console.log(error);
			});
	};
	
	
	const getCommentWithPid = async () => {
		
		const pid = document.querySelector('input#pid').value;
		
		const reqUrl = `/shape/comment/all/${pid}`;
		
		try {
			const response = await axios.get(reqUrl);
			console.log(response);
			
			//TODO: 댓글 개수 업데이트 & 댓글 목록 보여주기
			makeCommentElements(response.data);
		} catch(error) {
			console.log(error);
		}
	};
	getCommentWithPid(); // 함수 호출
	
	// 댓글 등록 버튼
	const btnAddComment = document.querySelector('button#btnAddComment');
	
	const createComment = (e) => {
		
		const pid = document.querySelector('input#pid').value; // 해당 게시글 id 왜 안됨
		
		const content = document.querySelector('textarea#content').value;
		const author = document.querySelector('input#author').value;
		const splitContent = content.split(' ').join('');
		
		if (!splitContent) {
			alert('댓글 작성');
			return;
		}
		
		const data = { pid, content, author };
		
		axios.post('/shape/comment', data)
			.then((response) => {
				// alert(`댓글 등록 성공 (${response.data})`);
				
				// 댓글 입력 창의 내용 지움
				document.querySelector('textarea#content').value = '';
				
				// 댓글 목록 새로고침
				getCommentWithPid();
				
			}) // 성공 응답이 왔을 때 실행 할 callback 함수 등록
			.catch((error) => {
				console.log(error);
			});
	};
	btnAddComment.addEventListener('click', createComment); // 함수를 외부에서 만드는 방법. callback 함수
	
});



 