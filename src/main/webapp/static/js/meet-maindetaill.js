/**
 * 찜 참여완료 버튼
 * const getdetailByMtid = async () => {
        // 참여자 목록을 요청하기 위한 포스트 번호(아이디)
        const mtid = document.querySelector('input#id').value;
        // 참여자 목록을 요청할 URL
        const reqUrl = `/shape/meet/maindetaill/all/${mtid}`;
        
        
        // Ajax 요청을 보내고 응답을 기다림.
        try {
            const response = await axios.get(reqUrl);
            console.log(response);
            // 댓글 개수 업데이트 & 댓글 목록 보여주기
            makeReplyElements(response.data);
        } catch (error) {
            console.log(error);
        }
    };
 * 
 */

	
	
	

	// 부트스트랩 Collapse 객체를 생성 - 초기 상태는 화면에서 안보이는 상태
    const bsCollapse = new bootstrap.Collapse('div#replyToggleDiv', {toggle: false});
    
    // 버튼 아이콘 이미지
    const toggleBtnIcon = document.querySelector('img#toggleBtnIcon');
	
	
	// 댓글 등록/목록 보이기/숨기기 토글 버튼에 이벤트 리스너를 등록
    const btnToggleReply = document.querySelector('button#btnToggleReply');
    btnToggleReply.addEventListener('click', () => {
        bsCollapse.toggle();
        
        if (toggleBtnIcon.alt === 'toggle-off') {
             toggleBtnIcon.src = '../static/images/sample/toggle-on.png';
             toggleBtnIcon.alt = 'toggle-on';
             
             // 댓글 전체 목록을 서버에 요청하고, 응답이 오면 화면 갱신.
             getdetailByMtid();
        } else {
            toggleBtnIcon.src = '../static/images/sample/toggle-off.png';
            toggleBtnIcon.alt = 'toggle-off';
            replies.innerHTML = '';
        }
    });
    
    