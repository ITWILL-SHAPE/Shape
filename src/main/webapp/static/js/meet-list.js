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

	// 모집중, 모집완료 설정. 

	// '모집중' 체크 박스 찾기 -> 체크 박스 클릭시 이미지 변경.
	const checkRecruitmentStatus = document.querySelector('label#button.btnDelete');

	// 모집중, 모집완료의 이미지를 찾기. 
	const recruiImg = document.querySelector('img#recruiImg');

	// 모집중,모집완료 이미지를 설정하는 함수. -> prti >= max: 모집완료이미지로 변경.

/*
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