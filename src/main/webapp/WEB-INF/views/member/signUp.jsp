<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../common/header.jsp" %>
	<div class="container">
		<div class="my-2 p-3 text-center">
			<h1>회원가입</h1>
		</div>
		<div class="text-center border bg-body rounded shadow-sm p-5">
			<div class="text-center">
				<div class="w-50 m-auto">
					<table class="table table-borderless align-middle text-start">
						<colgroup>
							<col width="20%">
						</colgroup>
						<tbody>
							<tr>
								<th class="p-0">아이디</th>
								<td>
									<div class="row">
										<div class="col-8">
											<input type="text" name="id" class="form-control"/>
										</div>
										<div class="col-4 p-0 text-end">
											<input type="hidden" id="idDupCheck" value="N">
											<button id="btnIdDupCheck" type="button" class="btn btn-secondary form-check-inline">중복체크</button>
										</div>	
									</div>								
								</td>
							</tr>
							<tr>
								<th class="p-0">비밀번호</th>
								<td class="text-start">
									<input type="password" name="pwd"
										class="form-control"/>
								</td>
							</tr>
							<tr>
								<th class="p-0">이름</th>
								<td>
									<input type="text" name="name"
										class="form-control"/>
								</td>
							</tr>
							<tr>
								<th class="p-0">성별</th>
								<td>
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio"
											name="gender" id="male" value="M" checked>
										<label class="form-check-label" for="male">
											남자
										</label>
									</div>
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio"
											name="gender" id="female" value="F">
										<label class="form-check-label" for="female">
											여자
										</label>
									</div>
								</td>
							</tr>
							<tr>
								<th class="p-0">생년월일</th>
								<td>
									<div class="input-group fw-700">
										<div class="input-group-prepend">
											<span class="input-group-text btn-classic">
												<i class="bi bi-calendar text-white"></i>
											</span>
										</div>
										<input class="datepicker form-control" name="birth">
									</div>								
								</td>
							</tr>
							<tr>
								<th class="p-0">휴대폰</th>
								<td>
									<input type="text" name="phone" oninput="checkPhone(this)"
										class="form-control" maxlength="13"/>
								</td>
							</tr>
							<tr>
								<th class="p-0">이메일</th>
								<td>
									<input type="email" name="email"
										class="form-control"/>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<button class="w-50 btn btn-lg btn-classic" id="signUpBtn">회원가입</button>			
			</div>
		</div>
	</div>
	<script src="<%=request.getContextPath()%>/static/js/sign-up.js"></script>
<%@ include file="../common/footer.jsp" %>