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
				
				<div class="tab-content h-330" id="tabContent">
					<!-- id 찾기 -->
					<div class="tab-pane fade show active p-5" id="findId"
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
										<div class="input-group form-check-inline">
											<input type="text" name="emailId" class="form-control"/>
											<select class="form-control" name="emailAddress">
												<option>@naver.com</option>
												<option>@daum.net</option>
												<option>@gmail.com</option>
												<option>@hanmail.com</option>
												<option>@yahoo.co.kr</option>
												<option value="self">직접 입력</option>
											</select>
											<button id="sendCode" type="button" class="btn btn-secondary">인증번호</button>
										</div>	
									</td>
								</tr>
								<tr id="findIdCode" style="display:none;">
									<th class="table-secondary">인증번호</th>
									<td class="text-start">
										<input type="text" name="codeId" class="form-control w-50 form-check-inline"/>
										<div class="message">
										</div>
									</td>
								</tr>
							</tbody>							
						</table>
						<div id="yourId">
						</div>
					</div>
					
					<!-- 비밀번호 찾기 -->
					<div class="tab-pane fade p-5" id="findPwd"
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
										<div class="input-group form-check-inline">
											<input type="text" name="emailId" class="form-control"/>
											<select class="form-control" name="emailAddress">
												<option>@naver.com</option>
												<option>@daum.net</option>
												<option>@gmail.com</option>
												<option>@hanmail.com</option>
												<option>@yahoo.co.kr</option>
												<option value="self">직접 입력</option>
											</select>
											<button id="sendCodePwd" type="button" class="btn btn-secondary">인증번호</button>
										</div>										
									</td>
								</tr>
								<tr id="findPwdCode" style="display:none;">
									<th class="table-secondary">인증번호</th>
									<td class="text-start">
										<input type="text" name="codePwd" class="form-control w-50 form-check-inline"/>
										<div class="message">
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

<script src="<%=request.getContextPath()%>/static/js/find-id-pwd.js"></script>
<%@ include file="../common/footer.jsp"%>