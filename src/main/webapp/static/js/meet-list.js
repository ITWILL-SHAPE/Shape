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

	$(document).ready(function() {

		// 모집중/모집완료 체크박스
		$('input[type=checkbox][name=mozipCheck]').change(function(e) {
			if ($(this).prop("checked")) {
				alert(`${this.value} is checked`);

				// 동적으로 폼 생성
				const form = $('<form>', {
					'action': './search',
					'method': 'GET'
				});

				// 폼에 데이터 추가
				form.append($('<input>', {
					'type': 'hidden',
					'name': 'mozipCheck',
					'value': 'checked'
				}));

				// 폼을 문서에 추가하고 제출
				form.appendTo('body').submit();
				
				$(this).attr('checked', true);
				
			}
			else {
				alert(`${this.value} is unchecked`);

				// 체크 해제시 list
				// 동적으로 폼 생성
				const form = $('<form>', {
					'action': './list',
					'method': 'GET'
				});
				
				// 폼에 데이터 추가
				form.append($('<input>', {
					'type': 'hidden',
					'name': 'mozipCheck',
					'value': 'unchecked'
				}));
				
				// 폼을 문서에 추가하고 제출
				form.appendTo('body').submit();
				
				$(this).removeAttr('checked');

			}
		});
	});

	// 찜

	/*<script>
		<sec:authorize access="isAuthenticated()">
			var id = '${cardList.id}'; // 사용자 ID
			var author = '${cardList.author}'; // 카드의 작성자 ID

			// 로그인한 사용자와 카드의 작성자가 일치하는 경우
			if (id === author) {
				// 클릭 가능한 하트로 설정
				document.querySelector('.heart_icon${status.begin}').addEventListener('click', function(e) {
					e.default
				});
							}
		</sec:authorize>

		<sec:authorize access="isAnonymous()" id="logNot">
							// 로그인하지 않은 사용자일 경우
			document.querySelector('.heart_icon${status.begin}').addEventListener('click', function() {
				alert('로그인이 필요합니다.');
							});
		</sec:authorize>
	</script>*/

	/*$('#logInUser').click(function() {
		alert('클릭했습니다.');
	});*/


	$('#logOutUser').click(function() {
		alert('로그인이 필요합니다.');
	});

	$('#logInUser').on('click', function(e) {
		e.preventDefault();
		$('#heartClickNot').find('button').prop('disabled', true);
		alert('클릭했습니다.');
	});





});