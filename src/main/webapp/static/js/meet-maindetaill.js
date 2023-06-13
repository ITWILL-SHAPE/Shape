/* 
 * USER DEtaill 페이지
 * 유저가 (guest)가 찜 클릭 찜 취소 참여 user정보까지 보여주는 페이지
*/
	
	document.addEventListener('DOMContentLoaded', () => {
		
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
		
	
	

	
	/*// 찜 클릭
	const btnLike = document.querySelector('button#like');
		let isLiked = false; // 초기 상태는 찜 클릭이 아닌 경우
			btnLike.addEventListener('click', () => {
	  		if (isLiked) {
				
	    	// 이미 찜 완료 상태인 경우
	    	btnLike.innerHTML = '찜 클릭 ♥';
	    	isLiked = false;
	      } else {
	    	// 찜 완료 상태가 아닌 경우
	    	btnLike.innerHTML = '찜 완료';
	    	isLiked = true;	
	    }
	});
	*/
	/*let isjoined = false; // 초기 상태는 참여하기가 아닌 경우*/
	
	// 참여 클릭
		const btnjoin = document.querySelector('button#join');
		let isjoined = false; // 초기 상태는 참여하기가 아닌 경우
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
					alert('참여완료 했습니다.');
					btnjoin.innerHTML = '참여완료';
				})
				.catch((error) => {
					console.log(error);
				});

		};
		btnjoin.addEventListener('click', meetJoin);
		// 댓글 삭제
		const deletemeetjoin = (e) => {
			console.log(e.target);
			if (!confirm('삭제?')) {
				return;
			}
			const mtid = e.target.getAttribute('data-id');
			const reqUrl = `/shape/meet/maindetail/${mtid}`;

			axios.delete(reqUrl)
				.then((response) => {
					console.log(response);
					btnjoin.innerHTML = '참여하기';
				})
				.catch((error) => {
					console.log(error);
				});
		};




// document	
});
	

	
	




	

	
    
    