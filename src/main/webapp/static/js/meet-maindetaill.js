/* 
 * USER DEtaill 페이지
 * 유저가 (guest)가 찜 클릭 찜 취소 참여 user정보까지 보여주는 페이지
*/
	
	document.addEventListener('DOMContentLoaded', () => {
		
		// 화면 전환
		const goToDetail = function(mtid) {
			window.location.href = `/shape/meet/maindetail?mtid=${mtid}`;
		}	
		
		
		// 부트스트랩 Collapse 객체를 생성 - 초기 상태는 화면에서 안보이는 상태
	    const bsCollapse = new bootstrap.Collapse('div#replyToggleDiv', {toggle: false});
	    
	    // 버튼 아이콘 이미지
	    const toggleBtnIcon = document.querySelector('img#toggleBtnIcon');
		
		
		// 목록 보이기/숨기기 토글 버튼에 이벤트 리스너를 등록
	    const btnToggleReply = document.querySelector('button#btnToggleReply');
	    btnToggleReply.addEventListener('click', () => {
	        bsCollapse.toggle();
	        
	        if (toggleBtnIcon.alt === 'toggle-off') {
	             toggleBtnIcon.src = '../static/images/sample/toggle-on.png';
	             toggleBtnIcon.alt = 'toggle-on';
	             
	             
	        } else {
	            toggleBtnIcon.src = '../static/images/sample/toggle-off.png';
	            toggleBtnIcon.alt = 'toggle-off';
	        
	        }
	    
	    });
	    
	    /**
		 * 배선영 참여인원 종료
		 * 
		 */
		// 참여인원 FULL
	
		$('button#full').click(function(e) {
			alert("참여가 종료된 모임 입니다.");
		});
		
		/** 
		 * 배선영 찜 
		 * 
		*/
		
		// 찜 누르기
		const meetlike = (e) => {
			const mtid = document.querySelector('input#mtid').value;
			const id = document.querySelector('input#id').value;
			
			const data = { mtid, id }

			axios.post('/shape/meet/like', data)
				.then((response) => {
					
					if (response.data) {
						goToDetail(mtid);
					} else {
						console.log('없음');
					}
				})
				.catch((error) => {
					console.log(error);
				});

		};
			$('button#like').click(function(e) {
				meetlike(e);
		});


	
	
	// 찜 취소
	$('button#unLike').click(function(e) {
			deletemeetlike(e);
		});
		const deletemeetlike = (e) => {
			e.preventDefault();

			console.log(e.target);
			

			const mtid = e.target.getAttribute('data-id');
			const id = e.target.getAttribute('data-login');
			const reqUrl = `/shape/meet/like/${mtid}/${id}`;
			console.log(mtid, id);

			axios.delete(reqUrl)
				.then((response) => {
					console.log(response);

					if (response.data) {
						goToDetail(mtid);
					} else {
						console.log('없든듸');
					}
					
				})
				.catch((error) => {
					console.log(error);
				});
		};
		
		
		/** 
		 * 배선영 참여 
		 * 
		*/

	// 참여하기
		const meetJoin = (e) => {
			const mtid = document.querySelector('input#mtid').value;
			const prtcp_id = document.querySelector('input#id').value;
			const name = document.querySelector('input#name').value;
			const gender = document.querySelector('input#gender').value;
			const phone = document.querySelector('input#phone').value;
			const email = document.querySelector('input#email').value;

			console.log(mtid, prtcp_id, name, gender, phone, email);

			const data = { mtid, prtcp_id, name, gender, phone, email };

			axios.post('/shape/meet', data)
				.then((response) => {
					alert('참여완료');
					if(response.data) {
						goToDetail(mtid);
					} else {
						console.log('없든듸');
					}			
				})
				.catch((error) => {
					console.log(error);
				});

		};
		 $('button#join').click(function(e) {
			meetJoin(e);
		});
		
		
		// 참여 취소
		$('button#delete').click(function(e) {
			deletemeetjoin(e);
		});
		// const btndelete = document.querySelector('button#delete');		
		// btndelete.addEventListener('click', deletemeetjoin);
		const deletemeetjoin = (e) => {
			e.preventDefault();
			
			console.log(e.target);
			if (!confirm('참여를 거부하시나요?')) {
				return;
			}
			const mtid = e.target.getAttribute('data-id');
			const id = e.target.getAttribute('data-login');
			const reqUrl = `/shape/meet/${mtid}/${id}`;

			axios.delete(reqUrl)
				.then((response) => {
					console.log(response);
					
					if(response.data) {
						goToDetail(mtid);
					} else {
						console.log('없든듸');
					}
					 alert('참여 취소 완료'); 
				})
				.catch((error) => {
					console.log(error);
				});
		};

		
});
	

	
	




	

	
    
    