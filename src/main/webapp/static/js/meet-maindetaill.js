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
	// 참여 클릭
	const btnjoin = document.querySelector('button#join');
	let isjoined = false; // 초기 상태는 참여하기가 아닌 경우
	/*
	const joindDetailModel = (e) => {
		const mtid = e.target.getAttribute('data-id');
		const reqUrl = `/shape/meet/maindetail/${mtid}`
		axios.get(reqUrl)
			.then((response)=> {
				const {mtid, }
			})
	};*/
/*btnjoin.addEventListener('click', () => {
    if (isjoined) {
        // 이미 참여한 상태인 경우
        alert('이미 참여하셨습니다.');
    } else {
        // 참여하지 않은 상태인 경우
        // AJAX 요청을 통해 사용자 정보를 가져오고 참여 정보를 삽입합니다.
        getUserInfo()
            .then((userInfo) => {
                if (userInfo) {
                    // 사용자 정보가 존재하는 경우 참여 정보를 삽입합니다.
                    insertParticipant(userInfo)
                        .then(() => {
                            // 참여 완료 메시지를 표시하고 버튼 상태를 변경합니다.
                            alert('참여되었습니다.');
                            btnjoin.innerHTML = '참여완료';
                            isjoined = true;
                        })
                        .catch((error) => {
                            console.error('참여 정보 삽입 중 오류 발생:', error);
                        });
                } 
            })
    }
});

// AJAX를 통해 사용자 정보를 가져오는 함수
function getUserInfo() {
    return new Promise((resolve, reject) => {
        const userId = '사용자의 고유한 아이디'; // 사용자의 고유한 아이디 값을 설정해야 합니다.
        const xhr = new XMLHttpRequest();
        xhr.open('GET', `/getUserInfo?userId=${userId}`);
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    const userInfo = JSON.parse(xhr.responseText);
                    resolve(userInfo);
                } else {
                    reject(xhr.statusText);
                }
            }
        };
        xhr.send();
    });
}

// AJAX를 통해 참여 정보를 삽입하는 함수
function insertParticipant(userInfo) {
    return new Promise((resolve, reject) => {
        const participantData = {
            mtid: '모임 ID', // 모임 ID 값을 설정해야 합니다.
            prtcp_id: userInfo.id,
            name: userInfo.name,
            gender: userInfo.gender,
            phone: userInfo.phone,
            email: userInfo.email,
        };

        const xhr = new XMLHttpRequest();
        xhr.open('POST', '/Prtcpinsert');
        xhr.setRequestHeader('Content-Type', 'application/json');
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    resolve();
                } else {
                    reject(xhr.statusText);
                }
            }
        };
        xhr.send(JSON.stringify(participantData));
    });
}*/

	/** 
	 *	const btnJoin = document.querySelector('button#join');
		let isJoined = false; // 초기 상태는 참여하지 않은 상태


btnJoin.addEventListener('click', () => {
  if (isJoined) {
    // 이미 참여한 상태인 경우
    alert('이미 참여하셨습니다.');
  } else {
    // 참여하지 않은 상태인 경우
    // AJAX 요청을 통해 사용자 정보를 가져오고 참여 정보를 삽입합니다.
    getUserInfo()
      .then((userInfo) => {
        if (userInfo) {
          // 사용자 정보가 존재하는 경우 참여 정보를 삽입합니다.
          insertParticipant(userInfo)
            .then(() => {
              // 참여 완료 메시지를 표시하고 버튼 상태를 변경합니다.
              alert('참여되었습니다.');
              btnJoin.innerHTML = '참여완료';
              isJoined = true;
            })
            .catch((error) => {
              console.error('참여 정보 삽입 중 오류 발생:', error);
            });
        } else {
          // 사용자 정보가 존재하지 않는 경우
          console.error('사용자 정보를 가져올 수 없습니다.');
        }
      })
      .catch((error) => {
        console.error('사용자 정보 조회 중 오류 발생:', error);
      });
  }
});

// AJAX를 통해 사용자 정보를 가져오는 함수
function getUserInfo() {
  return new Promise((resolve, reject) => {
    const userId = '사용자의 고유한 아이디'; // 사용자의 고유한 아이디 값을 설정해야 합니다.
    const xhr = new XMLHttpRequest();
    xhr.open('GET', `/getUserInfo?userId=${userId}`);
    xhr.onreadystatechange = function () {
      if (xhr.readyState === XMLHttpRequest.DONE) {
        if (xhr.status === 200) {
          const userInfo = JSON.parse(xhr.responseText);
          resolve(userInfo);
        } else {
          reject(xhr.statusText);
        }
      }
    };
    xhr.send();
  });
}

// AJAX를 통해 참여 정보를 삽입하는 함수
function insertParticipant(userInfo) {
  return new Promise((resolve, reject) => {
    const participantData = {
      mtid: '모임 ID', // 모임 ID 값을 설정해야 합니다.
      prtcp_id: userInfo.id,
      name: userInfo.name,
      gender: userInfo.gender,
      phone: userInfo.phone,
      email: userInfo.email,
    };

    const xhr = new XMLHttpRequest();
    xhr.open('POST', '/Prtcpinsert');
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.onreadystatechange = function () {
      if (xhr.readyState === XMLHttpRequest.DONE) {
        if (xhr.status === 200) {
          resolve();
        } else {
          reject(xhr.statusText);
        }
      }
    };
    xhr.send(JSON.stringify(participantData));
  });
}

	 
	**/
	
});
	

	
	




	

	
    
    