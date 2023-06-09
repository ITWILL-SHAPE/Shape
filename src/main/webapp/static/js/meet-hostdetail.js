/**
 * host가 수정버튼 삭제버튼 누를경우
 * 디테일 서비스
 * 
 *  </c:url>
	             <a href="${ updatePage }" type="button" class="btn btn-outline-primary btn-lg" id="btnUpdate" name="btnUpdate">수정하기</a>
	                  <a href="${delete }" type="button" class="btn btn-outline-danger btn-lg" id="btnDelete" name="btnDelete">삭제하기</a>   
	               </div>
	                  </div>
	        </c:if>
 */
 const inputmtid = document.querySelector('input#mtid');
 const btnUpdate = document.querySelector('button#btnUpdate');
 const btnDelete = document.querySelector('button#btnDelete');
 
 btnDelete.addEventListener('click',(e) => {
	 e.preventDefault();
	 
	 const id= inputmtid.value;
	 const result = confirm(`NO.${id} 정말 삭제할까요?`);
	 // 확인
	 console.log(`삭제 확인 결과 = ${result}`);
	 if(result){
		 form.action = 'delete';
		 form.method = '';
		 form.submit();
	 }
 });
 