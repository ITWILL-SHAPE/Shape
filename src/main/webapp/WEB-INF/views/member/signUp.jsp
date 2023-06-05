<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../common/header.jsp" %>
<div class="container">
		<span>회원가입</span>
		<div class="text-center border bg-body rounded shadow-sm signUpBox">
			<c:url var="signUp" value="/member/signUp"/>
			<form method="post" action="${ signUp }" class="text-center">
				<h1 class="my-4">회원가입</h1>
				<h6 class="text-muted">Shape에 오신 걸 환영합니다.</h6>
				<table class="table table-bordered">
					<tbody>
						<tr>
							<th>아이디</th>
							<td class="text-start">
								<input type="text" name="id"
									class="form-control"/>
							</td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td class="text-start">
								<input type="password" name="pwd"
									class="form-control"/>
							</td>
						</tr>
						<tr>
							<th>이름</th>
							<td class="text-start">
								<input type="text" name="name"
									class="form-control"/>
							</td>
						</tr>
						<tr>
							<th>성별</th>
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
							<th>생년월일</th>
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
							<th>휴대폰</th>
							<td class="text-start">
								<input type="text" name="phone"
									class="form-control"/>
							</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td class="text-start">
								<input type="text" name="email"
									class="form-control"/>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>
<%@ include file="../common/footer.jsp" %>