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


		// 찜




		/*$('#img-heart');

		LikeCheck = function(mtid, id) {
			console.log("찜 실시");
			alert("찜이 되었습니다.")

			const EmptyHeartimage = $('img.overlay-image');

			if (EmptyHeartimage.attr('alt') === 'toggle-off') {

				// 이미지의 src 속성 변경
				EmptyHeartimage.attr('src', '../static/images/sample/like.svg');

				EmptyHeartimage.attr('alt', 'toggle-on');


			} else {

				EmptyHeartimage.attr('src', '../static/images/sample/like2.svg');

				EmptyHeartimage.attr('alt', 'toggle-off');
			}


		}; onclick = "move_profile_page('${item.nickname}')"*/


		/*const mtid = document.querySelector('input#mtid').value;
		const id = document.querySelector('input#id').value;


		function LikeCheck(mtid, id) {
			const imgHeart = document.querySelector('img#img-heart');
			console.log("찜 실시");
			alert("찜이 되었습니다.")

			const EmptyHeartimage = $('img.overlay-image');

			if (EmptyHeartimage.attr('alt') === 'toggle-off') {

				// 이미지의 src 속성 변경
				EmptyHeartimage.attr('src', '../static/images/sample/like.svg');

				EmptyHeartimage.attr('alt', 'toggle-on');


			} else {

				EmptyHeartimage.attr('src', '../static/images/sample/like2.svg');

				EmptyHeartimage.attr('alt', 'toggle-off');
			}
		}*/


		//imgHeart.addEventListener('click', LikeCheck(mtid, id));
		/*$(function() {
			$("#img-heart").click(function() {
				LikeCheck(mtid, id);

			});
		});

		function LikeCheck(mtid, id) {
			console.log("찜 실시");
			alert("찜이 되었습니다.")

			const EmptyHeartimage = $('img.overlay-image');

			if (EmptyHeartimage.attr('alt') === 'toggle-off') {

				// 이미지의 src 속성 변경
				EmptyHeartimage.attr('src', '../static/images/sample/like.svg');

				EmptyHeartimage.attr('alt', 'toggle-on');


			} else {

				EmptyHeartimage.attr('src', '../static/images/sample/like2.svg');

				EmptyHeartimage.attr('alt', 'toggle-off');
			}
		}*/

	});

	// const imgHeart = document.querySelector('img#img-heart');


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