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

	// form 선택
	const searchFormCheckBox = document.querySelector('form#searchFormCheckBox');

	// 체크박스 선택
	const reverseCheck = document.querySelector('input#reverseCheck');

	// label 모집완료
	const checkRecruitmentEd = document.querySelector('label#checkRecruitmentEd');

	// label 모집중
	const checkRecruitmentIng = document.querySelector('label#checkRecruitmentIng');

	reverseCheck.addEventListener("click", () => {
		if (reverseCheck.checked) {

			// label 변화
			//checkRecruitmentEd.removeAttribute('hidden');
			//checkRecruitmentIng.setAttribute('hidden', true);


			/*// 페이지 로드 시 저장된 체크박스 상태를 적용
			const savedCheckboxState = localStorage.getItem('checkboxState');
			if (savedCheckboxState === 'true') {
				reverseCheck.checked = true;
			}

			// 폼 제출 시 체크박스 상태를 로컬 스토리지에 저장
			searchFormCheckBox.addEventListener('submit', (event) => {

				const isChecked = reverseCheck.checked;
				localStorage.setItem('checkboxState', isChecked);
				
				
			}); */
				checkRecruitmentIng.selected = true;

				// serch.jsp로 이동
				form.action = './change'; // 폼 제출(요청) 주소
				form.method = 'post'; // 요청 방식
				form.submit(); // 폼 제출

		} else {
			
				// list.jsp로 이동
				form.action = './comeback'; // 폼 제출(요청) 주소
				form.method = 'post'; // 요청 방식
				form.submit(); // 폼 제출
			

		}
	});







});