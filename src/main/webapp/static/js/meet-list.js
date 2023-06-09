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

		console.log("확인")

		cardList.innerHTML = ''; // 지움.
		let meetDetailPage = `/meet/maindetail`;
		let htmlStr = '';
		for (let card of data) {
			let cardId = card.id;
			let cardCategory = card.category;
			let cardAuthor = card.author;
			let cardLcnt = card.lcnt;
			let cardSido = card.sido;
			let cardTitle = card.title;
			let cardMtDate = card.mt_date;
			let cardPcnt = card.pcnt;
			let cardNmPpl = card.nm_ppl;

			htmlStr += `
				      <div class="album py-5">
				        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
				          <div class="col">
				            <a href="${meetDetailPage}?id=${cardId}" class="text-decoration-none" id="disable">
				              <div class="card shadow-sm image-container position-relative">
				                <svg class="bd-placeholder-img card-img-top" width="100%" height="220"
				                  xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail"
				                  preserveAspectRatio="xMidYMid slice" focusable="false">
				                  <rect width="100%" height="100%" fill="#55595c" />
				                </svg>
				                <span>
				                  <a href="javascript:" class="heart-click" data-card-id="${cardId}">
				                    <img src="../static/images/sample/like2.svg" alt="toggle-off" width="50"
				                      class="heart overlay-image overlay-right" />
				                  </a>
				                </span>
				                <div id="mozipIin${cardId}">
				                  <img id="mozipIin${cardId}" src="../static/images/sample/mozip_ing.svg" alt="recuriIng"
				                    width="80" class="overlay-image overlay-left" />
				                </div>
				                <div class="card-body">
				                  <div class="post-inner">
				                    <div class="row align-items-center">
				                      <div class="col-auto" id="post-category${cardId}">
				                        ${cardCategory}
				                      </div>
				                      <div class="col text-lg-end text-center">
				                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
				                          class="bi bi-suit-heart-fill" viewBox="0 0 16 16">
				                          <path
				                            d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z" />
				                        </svg>
				                        <span class="text-end" id="heart${cardId}">
				                          <em>${cardLcnt}</em>
				                        </span>
				                      </div>
				                    </div>
				                    <div id="post-sidoAndTitle${cardId}">
				                      [ ${cardSido} ] &lt;${cardTitle}&gt;
				                    </div>
				                    <div id="post-mtDate${cardId}">
				                      <span class="map">모집일정: ${cardMtDate}</span>
				                    </div>
				                  </div>
				                  <div class="text-lg-end text-center">
				                    <small class="text-muted">
				                      모집인원:
				                      <span id="currentApplicants${cardId}">${cardPcnt}</span>
				                      / <span id="maxApplicants${cardId}">${cardNmPpl}</span>
				                    </small>
				                  </div>
				                </div>
				              </div>
				            </a>
				          </div>
				        </div>
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
		const reqUrl = `/shape/api/reply/all`;

		// Ajax 요청을 보내고 응답을 기다림.
		try {
			const response = await axios.post(reqUrl)
				.then(response => {
					const redirectUrl = response.headers.location;
					console.log(response);
					const dataList = response.data;
					makeCardElements(dataList);
				})
				.catch()


		} catch (error) {
			console.log(error);
		}
	};

	// 체크박스 클릭시 모집중만 나오게.


	$('#reverseCheck').on('click', function() {

		// 모집완료 div를 찾기. 
		const mozipFin = document.querySelectorAll('img#mozipFin');

		// 체크 박스 상태 확인
		const isChecked = $(this).is(':checked'); // 체크박스가 가지고 있는 속성.
		alert('체크되었습니다.');

		// 목록 변화 처리
		if (isChecked) {
			// 선택되었을 떄의 동작 -> html 코드 중에이미지가 모집중인 것만 나와야 함. + 목록 불러오기 함수.
			//getCardAll();
			const currentApplicants = parseInt(document.querySelectorAll(`span#currentApplicants`).textContent);
			const maxApplicants = parseInt(document.querySelectorAll(`span#maxApplicants`).textContent);
			
			if (currentApplicants === maxApplicants) {
				
			}
			

		} else {
			// 선택해제되었을 떄의 동작. -> 원 페이지 들고 오면 됨
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