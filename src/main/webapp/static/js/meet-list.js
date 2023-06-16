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
document.addEventListener('DOMContentLoaded', () => {	
	
	// category 변경 시
	$('#category').change(() => {
		console.log('category');
		searchMeetList();
	});
	
	// 시도 변경 시
	$('#sido').change(() => {
		console.log('sido');
		searchMeetList();
	});
	
	// 제목 검색 시 - 버튼을 눌렀을 때
	$('#titleBtn').click(() => {
		console.log('title');
		searchMeetList();
	});
	
	// 제목 검색 시 - enter를 눌렀을 때
	$('input[name="searchTitle"]').on('keydown', function(e) {
		if (e.keyCode == 13) {
			e.preventDefault();
			console.log('title');
			searchMeetList();
		}
	});
	
	// 모집 여부
	$('input[name="searchMozipCheck"]:checkbox').click(() => {
		if($('input[name="searchMozipCheck"]:checkbox').is(":checked")) {
			$('input[name="searchMozipCheck"]:checkbox').attr('checked', 'checked');
			console.log('모집 중');
			searchMeetList();
		} else {
			console.log('모집 중이 아닌것도');
			$('input[name="searchMozipCheck"]:checkbox').removeAttr('checked');
			searchMeetList();
		}
	});
	
	// 정렬 방식 + 최신순, 인기순
	$('select[name="searchSortBy"]').change(() => {
		console.log('sortBy');
		searchMeetList();
	});
	
	
	
	

	/*주말*/
	const imgHeart = document.querySelectorAll('img#img-heart');
	
	for(let img of imgHeart) {
		img.addEventListener('click', LikeCheck);
	};
	
	
	function LikeCheck() {

		//const mtid = document.querySelector('input#mtid').value;
		//const id = document.querySelector('input#id').value;

		console.log('ddd');

	};

	//imgHeart.addEventListener('onclick', LikeCheck);


});


// 검색 function
const searchMeetList = function() {
	// 검색 영역 value 확인
	const searchCategory = $('#category').val();
	const searchSidoValue = $('#sido').val();
	const searchTitle = $('#titleBtn').val();
	const searchSortBy = $('select[name="searchSortBy"]').val();
	const searchMozipCheck = $('input[name="searchMozipCheck"]:checkbox').is(":checked");
	
	let data = {
		searchCategory : searchCategory,
		searchSidoValue : searchSidoValue,
		searchTitle : searchTitle,
		searchSortBy : searchSortBy,
		searchMozipCheck : searchMozipCheck
	}
	
	console.log(data);
	
	const searchMeetList = $('#searchMeetList');
	searchMeetList.submit();
	
}