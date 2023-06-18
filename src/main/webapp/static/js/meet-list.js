/**
 * 모집중/모집완료 체크박스
 * -> search.jsp로
 * -> 체크박스에 체크가 되어있는지 확인: 모집중 -> form 제출하기 search.jsp로 이동.
 * -> 체크박스 체크가 안 되어있으면: list.jsp로 이동.
 * 
 * 찜수
 * 
 * 페이징
 * 
 * post/list.jsp
 * 
 * -> 모임 찾기에 업로드.
 * 
 * 김지민
 * 
 */

let targetPage = '';

document.addEventListener('DOMContentLoaded', () => {

	// category 변경 시
	$('#category').change((e) => {
		console.log('category');
		searchMeetList(e);
	});

	// 시도 변경 시
	$('#sido').change((e) => {
		console.log('sido');
		searchMeetList(e);
	});

	// 제목 검색 시 - 버튼을 눌렀을 때
	$('#titleBtn').click((e) => {
		console.log('title');
		searchMeetList(e);
	});

	// 제목 검색 시 - enter를 눌렀을 때
	$('input[name="searchTitle"]').on('keydown', function(e) {
		if (e.keyCode == 13) {
			e.preventDefault();
			console.log('title');
			searchMeetList(e);
		}
	});

	// 모집 여부
	$('input[name="searchMozipCheck"]:checkbox').click((e) => {
		if ($('input[name="searchMozipCheck"]:checkbox').is(":checked")) {
			$('input[name="searchMozipCheck"]:checkbox').attr('checked', 'checked');
			console.log('모집 중');
			searchMeetList(e);
		} else {
			console.log('모집 중이 아닌것도');
			$('input[name="searchMozipCheck"]:checkbox').removeAttr('checked');
			searchMeetList(e);
		}
	});

	// 정렬 방식 + 최신순, 인기순
	$('select[name="searchSortBy"]').change((e) => {
		console.log('sortBy');
		searchMeetList(e);
	});

	// 페이징 클릭시
	$(".page-link").on("click", function(e) {
		e.preventDefault();
		targetPage = e.target.closest("a").textContent;
		searchMeetList(e);
	});



	/*주말*/



	const imgHeart = document.querySelectorAll('img#img-heart');

	for (let img of imgHeart) {
		img.addEventListener('click', LogInLikeCheck);
	};

	const imgUnHeart = document.querySelectorAll('img#img-heartEmpty');

	for (let img of imgUnHeart) {
		img.addEventListener('click', LogLikeUnCheck);
	};

	const mtid = document.querySelector('input#mtid').value;
	const id = document.querySelector('input#id').value;

	const data = { mtid, id }

	// 빨간하트 찜 취소
	function LogInLikeCheck(event) {
		event.preventDefault();

		console.log('찜을 취소할거예요');
		console.log(event.target);


		const mtid = event.target.getAttribute('data-id');
		const id = event.target.getAttribute('data-login');
		const reqUrl = `/shape/meet/like/${mtid}/${id}`;
		console.log(mtid, id);
		
		
		

		axios.delete(reqUrl)
			.then((response) => {
				console.log(response);

				if (response.data) {
					goToList();
				} else {
					console.log('없든듸');
				}

			})
			.catch((error) => {
				console.log(error);
			});
		

	};
	
	// 찜 함
	function LogLikeUnCheck() {
		
		console.log('찜을 할거예요');
		
		axios.post('/shape/meet/like', data)
			.then((response) => {

				if (response.data) {
					goToList();
				} else {
					console.log('없음');
				}
			})
			.catch((error) => {
				console.log(error);
			});


		

	};



});

// 화면 전환
const goToList = function() {
	window.location.href = `/shape/meet/list`;
}



// 페이징 처리
// 검색 function
const searchMeetList = function(e) {
	// 검색 영역 value 확인
	const searchCategory = $('#category').val();
	const searchSidoValue = $('#sido').val();
	const searchTitle = $('#titleBtn').val();
	const searchSortBy = $('select[name="searchSortBy"]').val();
	const searchMozipCheck = $('input[name="searchMozipCheck"]:checkbox').is(":checked");

	if (targetPage == null || targetPage == '') {
		targetPage = $('input[name="pageNum"]').val();
	}

	let data = {
		searchCategory: searchCategory,
		searchSidoValue: searchSidoValue,
		searchTitle: searchTitle,
		searchSortBy: searchSortBy,
		searchMozipCheck: searchMozipCheck
	}

	console.log(data);
	
	// form
	const searchMeetList = $('#searchMeetList');
	
	// pageNum
	searchMeetList.find('input[name="pageNum"]').val(targetPage);
	searchMeetList.submit();

}