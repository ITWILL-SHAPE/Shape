<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../common/header.jsp" %>
	<div class="container">
		<span>회원가입</span>
		<div class="text-center border bg-body rounded shadow-sm signUpBox">
			<div class="text-center">
				<h1 class="my-4">회원가입</h1>
				<h6 class="text-muted">Shape에 오신 걸 환영합니다.</h6>
				<div class="p-3">
					<table class="table table-bordered align-middle">
						<colgroup>
							<col width="20%">
						</colgroup>
						<tbody>
							<tr>
								<th class="table-secondary">아이디</th>
								<td class="text-start">
									<input type="text" name="id" class="form-control w-25 form-check-inline"/>
									<input type="hidden" id="idDupCheck" value="N">
									<button id="btnIdDupCheck" type="button" class="btn btn-secondary form-check-inline">중복체크</button>
								</td>
							</tr>
							<tr>
								<th class="table-secondary">비밀번호</th>
								<td class="text-start">
									<input type="password" name="pwd"
										class="form-control w-25"/>
								</td>
							</tr>
							<tr>
								<th class="table-secondary">이름</th>
								<td class="text-start">
									<input type="text" name="name"
										class="form-control w-25"/>
								</td>
							</tr>
							<tr>
								<th class="table-secondary">성별</th>
								<td class="text-start">
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
								<th class="table-secondary">생년월일</th>
								<td class="text-start">
									<div class="input-group fw-700 w-25">
										<div class="input-group-prepend">
											<span class="input-group-text bg-color-blue">
												<i class="bi bi-calendar text-white"></i>
											</span>
										</div>
										<input class="datepicker form-control" name="birth">
									</div>								
								</td>
							</tr>
							<tr>
								<th class="table-secondary">휴대폰</th>
								<td class="text-start">
									<input type="text" name="phone" oninput="checkPhone(this)"
										class="form-control w-50" maxlength="13"/>
								</td>
							</tr>
							<tr>
								<th class="table-secondary">이메일</th>
								<td class="text-start">
									<input type="email" name="email"
										class="form-control w-50"/>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<button class="w-50 btn btn-lg btn-primary" id="signUpBtn">회원가입</button>			
			</div>
		</div>
	</div>
	<script src="<%=request.getContextPath()%>/static/js/sign-up.js"></script>
<%@ include file="../common/footer.jsp" %>