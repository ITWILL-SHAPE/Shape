/**
 * 검색(카테고리, 제목, sido, 인기순, 최신순,)
 * 모집중/모집완료 -> 설정필
 * 
 * post/list.jsp
 * 
 * -> 모임 찾기에 업로드.
 * 
 */
document.addEventListener('DOMContentLoaded', () => {

	/*
	 모집중 이미지 수정하는 함수 -> #cardList 요소 html 코드 변경.
	 */	
	const cardList = document.querySelector('div#cardList');
	const makeCardElements = (data) => {
		
		cardList.innerHTML = ''; // 지움.
		
		let htmlStr = '';
		
		 for (let cardList of data) {
			htmlStr += `
				 <div id="mozipIin${cardList.begin}">
	              	   <img id="mozipIin${cardList.begin}" src="../static/images/sample/mozip_ing.svg" alt="recuriIng"
	                		width="80" class="overlay-image overlay-left" />
	               </div>
			`;
		 }
		cardList.innerHTML = htmlStr;	
	}	
		
	/*
	카드 목록 불러오기 함수
	*/
	const getCardAll = async () => {
		// 댓글 목록을 요청할 URL
		const reqUrl = `/shape/api/meet/list/all`;
		
		// Ajax 요청을 보내고 응답을 기다림.
		try {
			const response = await axios.get(reqUrl);
			console.log(response);
			makeCardElements(response.data);
			
		} catch (error) {
			console.log(error);
		}
	};
	/*
	체크박스 클릭시 모집중만 나오게.
	 */

	$('#reverseCheck').on('click', function() {

	// 모집중 이미지를 찾기. 
	const mozipIin = document.querySelector('img#mozipIin' + status.begin);

		// 체크 박스 상태 확인
		const isChecked = $(this).is(':checked'); // 체크박스가 가지고 있는 속성.
		alert('체크되었습니다.');
		
		// 목록 변화 처리
		if (isChecked) {
			// 선택되었을 떄의 동작 -> html 코드 중에이미지가 모집중인 것만 나와야 함. + 목록 불러오기 함수.
				getCardAll();
			//TODO: 모집중 체크하면 모집중만 나와야 함. -> 43 줄에서 에러가 남.
			
		} else {
			// 선택해제되었을 떄의 동작.
		}
	});

	/* 
	찜수 업뎃: 하트 이미지 클릭시 이미지 변경 및 lcnt값의 변경.
	
	const bsCollapse = new bootstrap.Collapse('div#replyToggleDiv', { toggle: false });
	// 하트 이미지
	const toggleBtnIcon = document.querySelector('img#toggleBtnIcon${status.begin}');

	// 댓글 등록/목록 보이기/숨기기 토글 버튼에 이벤트 리스너를 등록
	const btnToggleReply = document.querySelector('button#btnToggleReply${status.begin}');

	btnToggleReply.addEventListener('click', (e) => {
		e.preventDefault()
		console.log(e);
		alert("확인")
		bsCollapse.toggle();
		// const toggle = btnToggleReply.getAttribute('data-toggle'); // btnToggleReply가 가지고 있는 data-toggle 속성의 값을 리턴

		if (toggleBtnIcon.alt === 'toggle-off') { //toggle === 'toggle-off'
			toggleBtnIcon.src = '../static/images/sample/like.svg';
			toggleBtnIcon.alt = 'toggle-on';

			console.log("if문 확인");

			// axios: 찜 테이블로 insert
			const mtid = `${cardList.mtid}`
			console.log(mtid);
			const reqUrl = `/shape/api/meet/list/${mtid}`;

			axios.post(reqUrl, data)
				.then((response) => {
					console.log(response);
					const userId = response.data[0];
				})
				.catch((error) => {
					console.log(error);
				});

		} else {
			toggleBtnIcon.src = '/shape/api/meet/list/${mtid}';
			toggleBtnIcon.alt = 'toggle-off';

			// axios: 찜 테이블에서 delete
			const reqUrl = `/shape/api/meet/list/${mtid}`;

			axios.delete(reqUrl)
				.then((response) => {
					console.log(response);
					const userId = response.data[0];
				})
				.catch((error) => {
					console.log(error);
				});

		}
		// return false


	});

	// 로그인 한 상태에서 하트를 클릭했을 떄 (로그인 한 상태인 하트의 <a><a> class 명: heart-click)
	$(".heart-click").click(function() {

		// 게시물 번호(no)를 idx로 전달받아 저장.
		let no = $(this).attr('idx');
		console.log("heare-click");

		// 빈하트를 눌럿을 댸
		if ($(this).children('img').attr('class') == "heart") {
			console.log("빈하트 클릭" + no);

			// axios: 찜 테이블로 insert
			const mtid = `${cardList.mtid}`
			console.log(mtid);
			const reqUrl = `/shape/api/meet/list/${mtid}`;

			$.axios.post(reqUrl, data)
				.then((response) => {
					console.log(response);
					const userId = response.data[0];
				})
				.catch((error) => {
					console.log(error);
				});

		}

	}); */

	/*
	검색 기능.
	*/
	
	// 제목 검색.
	
	// input#id의 입력한 값.
	const searchTitle = document.querySelector(`input#searchTitle`).value;

	// button#titleBtn값
	const titleBtn = document.querySelector(`button#titleBtn`);

	titleBtn.addEventListener('click', (e) => {
		console.log(e);
		
		const reqUrl = `/shape/api/meet/list/all`;
		
		axios.get(reqUrl, {
			params: {
				keyword: searchTitle
			}
		})
			.then((response) => {
				conosle.log(response)	
			})
			.catch((error) => {
				console.log(error)
			});
		
	});
	






});