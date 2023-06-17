<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet"
		    href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
		    integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
		    crossorigin="anonymous">
		 
		<!-- Optional theme -->
		<link rel="stylesheet"
		    href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
		    integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
		    crossorigin="anonymous">
		 
		<!-- Latest compiled and minified JavaScript -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	</head>
	<body>
		<br />
		<h1 class="text-center">Board Write</h1>
		<br />
		<br />
		<div class="container">
			<form id="form_test" action="/shape/test/upload" method="post"
				encType="multipart/form-data">
				<table class="table table-bordered">
					<tbody>
						<tr>
							<th>제목</th>
							<td>
							     <input type="text" placeholder="제목을 입력하세요."
								name="testTitle" class="form-control" />
							</td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea placeholder="내용을 입력하세요 ." name="testContent"
									class="form-control" style="height: 200px;"></textarea>
							</td>
						</tr>
						<tr>
							<th>첨부파일</th>
							<td><input type="file" name="uploadFile"></td>
						</tr>
						<tr>
							<td colspan="2">
								<button id="btn_register" type="button" class="btn_register">등록</button>
								<button id="btn_previous" type="button" class="btn_previous">이전</button>
							</td>
						</tr>
	
					</tbody>
				</table>
			</form>
		</div>
	</body>
	<script type="text/javascript">
	    //글쓰기
	    $(document).on('click', '#btn_register', function(e) {
	        $("#form_test").submit();
	    });
	 
	    //이전 클릭 시 testList로 이동
	    $("#btn_previous").click(function previous() {
	        $(location).attr('href', '/shape/test/testHandler');
	 
	    });
	</script>
    </body>
</html>