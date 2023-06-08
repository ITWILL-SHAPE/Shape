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
	찜수 업뎃: 하트 이미지 클릭시 이미지 변경 및 lcnt값의 변경.
	*/
	
	
	  
	  // 버튼 아이콘 이미지
    const toggleBtnIcon = document.querySelector('img#toggleBtnIcon');
    
    // 댓글 등록/목록 보이기/숨기기 토글 버튼에 이벤트 리스너를 등록
    const btnToggleReply = document.querySelector('button#btnToggleReply');  
    //const link = document.querySelector("a#disableLink");
    
    btnToggleReply.addEventListener('click', (e) => {
		e.preventDefault()
		 alert("확인")
        bsCollapse.toggle();
       // const toggle = btnToggleReply.getAttribute('data-toggle'); // btnToggleReply가 가지고 있는 data-toggle 속성의 값을 리턴
        
        if (toggleBtnIcon.alt === 'toggle-off') { //toggle === 'toggle-off'
             toggleBtnIcon.src = '../static/images/sample/like.svg';
             toggleBtnIcon.alt = 'toggle-on';
            
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
			const mtid = heartImg.id.split('-')[1];
			console.log(mtid);
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
	










});