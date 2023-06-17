<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<h1>이미지</h1>
		<div class="container">
            <form id="form_test" action="/shape/please/please" method="post"
                encType="multipart/form-data">
                <table class="table table-bordered">
                    <tbody>
                        <tr>
                            <th>첨부파일</th>
                            <td><input type="file" name="uploadFile"></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <button id="btn_register" type="button" class="btn_register">등록</button>
                            </td>
                        </tr>
    
                    </tbody>
                </table>
            </form>
            
            <table class="table table-hover align-middle text-center users">
                    <colgroup>
                        <col width="5%">
                        <col width="20%">
                    </colgroup>
                    <thead class="table-dark">
                        <tr>
                            <th>NO</th>
                            <th>파일 이름</th>
                            <th>파일</th>
                        </tr>
                    </thead>
                    <tbody id="userList">
                        <c:forEach items="${ list }" var="file" varStatus="state">
                            <tr>
                                <td>${ file.idx }</td>
                                <td>${ file.fileName }</td>
                                <td>
                                    <
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>                    
                </table>
        </div>
        
        <script type="text/javascript">
	        $(document).on('click', '#btn_register', function(e) {
	        	let Form = new FormData($('#form_test')[0]);
	        	for (let item of Form.entries()) {
	        	    console.log(item[0] + " : " + item[1]);
	        	}

	            $("#form_test").submit();
	        });
	        
	        
	     
	    </script>
	</body>
</html>