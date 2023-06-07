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
	
	const recruNumbers = `${listCount}`; // controller에서의 넘겨준 값.
	
	//for(const =)
	
	
	// 찜수 업뎃: 하트 이미지 클릭시 이미지 변경 및 lcnt값의 변경.
	const heartBtns = document.querySelectorAll("[id^='heartBtn-']");
	const data = {
		id
	}
    heartBtns.forEach(function(btn) {
        btn.addEventListener("click", function(event) {
            event.preventDefault(); // 기본 링크 이동 동작을 막음 
            
            //클릭시 이미지 변경
			 if (heartBtns.alt === 'notLike') { 
             heartBtns.src = '../static/images/sample/like.svg';
             heartBtns.alt = 'like;
             
             // btnToggleReply.setAttribute('data-toggle', 'toggle-on');
            
            // axios: 찜 테이블로 insert
            const mtid = document.querySelector('img[id^="heartBtn-"]').id.split('-')[1];
           	console.log(meetId);
            const reqUrl = `/shape/api/meet/list/${mtid}`;
            
            axios.post(reqUrl,data)
            	.then((response) => {
					console.log(response);
					const userId = response.data[0];
				})
            	.catch((error) => {
					console.log(error);
				})
            
            
        } else {
			toggleBtnIcon.src = '../static/images/sample/like2.svg';
            toggleBtnIcon.alt = 'notLike';
            
             // axios:  delete
            axios.post(reqUrl,data)
            	.then((response) => {
					console.log(response);
					const userId = response.data[0];
				})
            	.catch((error) => {
					console.log(error);
				})
		 }

            
        });
   
	
	




 });