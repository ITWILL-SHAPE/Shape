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

		const author = document.querySelector('input#author').value;

		let htmlStr = ''; // 문자열을 계속 덧붙이려고 let으로 설정

		for (let comment of data) {
			let imageBuf = '../static/images/common/user.png';
			if (author !== comment.author) {
				if (comment.profile !== null) {
					console.log("profile 있음");
					//console.log(comment.profile.slice(0, 100));
					imageBuf = 'data:image/png;base64, ' + comment.file;
				}
				// Timestamp 타입 값을 날짜/시간 타입 문자열로 변환:
				const modified = new Date(comment.modifiedDate).toLocaleString();
				// 댓글 1개를 표시할 HTML 코드:
				htmlStr += `
                <div class="card p-3 mb-2" id="${comment.pcid}">
                	<div class="row">
                		<div class="col-1">
                			<div class="text-center me-3 profile" style="width: 70px; height: 70px; border-radius: 70%; overflow: hidden;" >
                				<img style="width: 100%; height: 100%; object-fit: cover;"
										src="${imageBuf}" />
                			</div>
                		</div>	
                		
                		<div class="col-11">
		                	<!-- 작성자, 작성시간 -->
		                    <div>
		                        <span class="d-none">${comment.pcid}</span>
		                        <span class="fw-bold">${comment.author}</span>
		                        <span class="text-secondary">${modified}</span>
		                    </div>
		                    <!-- 댓글 내용 -->
		                    <div id="modifyContent${comment.pcid}">
			                    <div id="text${comment.pcid}">
			                        <pre class="pre-bootstrap">${comment.content}</pre>
			                    </div>   
		                    </div>  
	                    </div>
                    
                   </div>      
                </div>
            `;
			} else {
				if (comment.profile !== null) {
					console.log("profile 있음");
					//console.log(comment.profile.slice(0, 100));
					imageBuf = 'data:image/png;base64, ' + comment.file;
				}
				// Timestamp 타입 값을 날짜/시간 타입 문자열로 변환:
				const modified = new Date(comment.modifiedDate).toLocaleString();
				// 댓글 1개를 표시할 HTML 코드:
				htmlStr += `
               <div class="card p-3 mb-2" id="${comment.pcid}">
                	<div class="row">
                		<div class="col-1">
                			<div class="text-center me-3 profile" style="width: 70px; height: 70px; border-radius: 70%; overflow: hidden;" >
                				<img style="width: 100%; height: 100%; object-fit: cover;"
									src="${imageBuf}" />
                			</div>
                		</div>	
                		
                		<div class="col-11">
                			<div class="row">
			                	<!-- 작성자, 작성시간 -->
			                    <div class="col-10">
			                        <span class="d-none">${comment.pcid}</span>
			                        <span class="fw-bold">${comment.author}</span>
			                        <span class="text-secondary">${modified}</span>
			                    </div>
			                    <!-- 버튼 -->
			                    <div class="col-2 d-grid gap-2 d-md-flex justify-content-md-end" id="buttonDiv${comment.pcid}">
			                    	<button class="btnModify btn btn-classic btn-sm" data-id="${comment.pcid}">
			                            수정
			                        </button>
			                        <button class="btnDelete btn btn-secondary btn-sm" data-id="${comment.pcid}">
			                            삭제
			                        </button>
		                   		</div>
		                   	</div>
		                    <!-- 댓글 내용 -->
		                    <div id="modifyContent${comment.pcid}">
			                    <div id="text${comment.pcid}">
			                        <pre class="pre-bootstrap">${comment.content}</pre>
			                    </div>   
		                    </div>  
                    	</div>
                   </div>      
                </div>
            	`;
			}
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



	// 댓글 수정 버튼의 이벤트 리스너 (콜백) 함수
	const showUpdateDiv = (e) => {
		const pcid = e.target.getAttribute('data-id');
		const before = $('div#text' + pcid).text().trim();

		$('div#text' + pcid).html('<textarea name="updateText" class="form-control mt-2">' + before + '</textarea>');
		$('div#buttonDiv' + pcid).html(`
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
				<button id="btnUpdateDiv" type="button" class="btn btn-primary btn-sm" data-id="${pcid}">
					등록
				</button>
			</div>
		`);

		$('#btnUpdateDiv').click(function(e) {
			const reqUrl = `/shape/comment/${pcid}`;
			const content = $('textarea[name="updateText"]').val().trim();
			const data = { content };

			axios.put(reqUrl, data)
				.then((response) => {
					getCommentWithPid();
				})
				.catch((error) => console.log(error))
		})

	};



	// 댓글 삭제 버튼의 이벤트 리스너 (콜백) 함수
	const deleteComment = (e) => {
		console.log(e.target);
		if (!confirm('삭제하시겠습니까?')) {
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
		} catch (error) {
			console.log(error);
		}
	};
	getCommentWithPid(); // 함수 호출

	// 댓글 등록 버튼
	const btnAddComment = document.querySelector('button#btnAddComment');

	const createComment = (e) => {

		const pid = document.querySelector('input#pid').value; // 해당 게시글 id

		const content = document.querySelector('textarea#content').value;
		const author = document.querySelector('input#author').value;
		const splitContent = content.split(' ').join('');

		if (!splitContent) {
			alert('댓글을 작성하세요');
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



