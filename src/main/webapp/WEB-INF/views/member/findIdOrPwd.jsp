<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../common/header.jsp"%>
	<div class="container mb-55">
		<span>아이디 및 비밀번호 찾기</span>
		<div class="text-center border bg-body rounded shadow-sm p-3 my-2">
			<h1 class="my-4">아이디 및 비밀번호 찾기</h1>
			<div class="my-2 border">
				<ul class="nav nav-pills nav-justified" id="findTab" role="tablist">
					<li class="nav-item" role="presentation">
						<button class="nav-link rounded-0 active" id="findId-tab" type="button"
							data-bs-toggle="tab" data-bs-target="#findId"
							aria-selected="true" role="tab" aria-controls="findId">
							아이디 찾기
						</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link rounded-0" id="findPwd-tab" type="button"
							data-bs-toggle="tab" data-bs-target="#findPwd"
							aria-selected="true" role="tab" aria-controls="findPwd">
							비밀번호 찾기
						</button>
					</li>
				</ul>
				<div class="tab-content" id="tabContent">
					<div class="tab-pane fade show active p-3" id="findId"
						role="tabpanel" aria-labelledby="findId-tab" tabindex="0">
						<table class="table table-bordered align-middle">
							<colgroup>
								<col width="20%">
							</colgroup>
							<tbody>
								<tr>
									<th class="table-secondary">이름</th>
									<td class="text-start">
										<input type="text" name="name" class="form-control w-50"/>
									</td>
								</tr>
								<tr>
									<th class="table-secondary">이메일</th>
									<td class="text-start">
										<input type="email" name="email" class="form-control w-50 form-check-inline"/>
										<button id="sendCodeFindId" type="button" class="btn btn-secondary">인증번호</button>
									</td>
								</tr>
								<tr id="findIdCode" style="display:none;">
									<th class="table-secondary">인증번호</th>
									<td class="text-start">
										<input type="text" name="codeId" class="form-control w-50 form-check-inline"/>
										<!-- <button id="codeCheckId" type="button" class="btn btn-primary">인증</button> -->
										<div class="errorMessage">
											인증번호가 불일치 합니다.
										</div>
									</td>
								</tr>
							</tbody>							
						</table>
						<div id="yourId">
						</div>
					</div>
					
					<div class="tab-pane fade p-3" id="findPwd"
						role="tabpanel" aria-labelledby="findPwd-tab" tabindex="0">
						<table class="table table-bordered align-middle">
							<colgroup>
								<col width="20%">
							</colgroup>
							<tbody>
								<tr>
									<th class="table-secondary">아이디</th>
									<td class="text-start">
										<input type="text" name="id" class="form-control w-50"/>
									</td>
								</tr>
								<tr>
									<th class="table-secondary">이름</th>
									<td class="text-start">
										<input type="text" name="name" class="form-control w-50"/>
									</td>
								</tr>
								<tr>
									<th class="table-secondary">이메일</th>
									<td class="text-start">
										<input type="email" name="email" class="form-control w-50 form-check-inline"/>
										<button id="sendCodefindPwd" type="button" class="btn btn-secondary">인증번호</button>
									</td>
								</tr>
								<tr id="findPwdCode" style="display:none;">
									<th class="table-secondary">인증번호</th>
									<td class="text-start">
										<input type="text" name="code" class="form-control w-50 form-check-inline"/>
										<button id="codeCheckPwd" type="button" class="btn btn-primary">인증</button>
									</td>
								</tr>
							</tbody>							
						</table>
					</div>
				</div>

					<!-- 이메일 예시 -->
					<div class="form-group email-form">
						<label for="email">이메일</label>
						<div class="input-group">
							<input type="text" class="form-control" name="userEmail1"
								id="userEmail1" placeholder="이메일"> <select
								class="form-control" name="userEmail2" id="userEmail2">
								<option>@naver.com</option>
								<option>@daum.net</option>
								<option>@gmail.com</option>
								<option>@hanmail.com</option>
								<option>@yahoo.co.kr</option>
							</select>
						</div>
						<div class="input-group-addon">
							<button type="button" class="btn btn-primary" id="mail-Check-Btn">본인인증</button>
						</div>
						<div class="mail-check-box">
							<input class="form-control mail-check-input"
								placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
						</div>
						<span id="mail-check-warn"></span>
					</div>
				</div>
		</div>
	</div>
	<script>
		$('#mail-Check-Btn').click(function() {
			const eamil = $('#userEmail1').val() + $('#userEmail2').val(); // 이메일 주소값 얻어오기!
			console.log('완성된 이메일 : ' + eamil); // 이메일 오는지 확인
			const checkInput = $('.mail-check-input') // 인증번호 입력하는곳 
			const reqUrl = '/shape/member/mailCheck/' + eamil;
			
			axios.get(reqUrl)
			.then ((response) => {
				console.log("data : " +  response.data);
				checkInput.attr('disabled',false);
				code = response.data;
				alert('인증번호가 전송되었습니다.');
			})
			.catch((error) => {
				console.log(error);
				alert('인증번호 발송 오류');
			});
		}); // end send eamil
	
		$('.mail-check-input').blur(function () {
				const inputCode = $(this).val();
				const $resultMsg = $('#mail-check-warn');
				
				if(inputCode == code){
					$resultMsg.html('인증번호가 일치합니다.');
					$resultMsg.css('color','green');
					$('#mail-Check-Btn').attr('disabled',true);
					$('#userEamil1').attr('readonly',true);
					$('#userEamil2').attr('readonly',true);
					$('#userEmail2').attr('onFocus', 'this.initialSelect = this.selectedIndex');
			         $('#userEmail2').attr('onChange', 'this.selectedIndex = this.initialSelect');
				}else{
					$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
					$resultMsg.css('color','red');
				}
			});
	</script>
<script src="<%=request.getContextPath()%>/static/js/find-id-pwd.js"></script>
<%@ include file="../common/footer.jsp"%>