<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		
		<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
		
		<title>왜 안돼</title>
	</head>
	<body>
		왜오애왜왤왜ㅗ애
	
	
		<a class="p-2"
			href="https://kauth.kakao.com/oauth/authorize?client_id=REST API키주소&redirect_uri=uri주소 &response_type=code">
			<p class="login_option">
				<span class="pet_btn login_btn kakao_btn">카카오톡계정으로 로그인하기</span>
			</p>
		</a>




		<div class="m-5 p-2">
			<input id="test1" name="test1">
			<input id="test2" name="test2">
			<input id="test3" name="test3" type="file">
	
			<button onclick="send()">전송</button>

		<script>
			function send() {
				var test3 = $('input[name="test3"]').get(0).files[0];
				var test1 = $("#test1").val()
				var test2 = $("#test2").val()
				var formData = new FormData();
				formData.append('test1', test1);
				formData.append('test2', test2);
				formData.append('test3', test3);
				
				console.log(formData);

				$.ajax({
					type : 'POST',
					url : '/test/testPro.do',
					processData : false,
					contentType : false,
					data : formData,
					success : function(json) {
						alert("등록되었습니다.");

					},
					error : function(xhr, status, error) {
						alert("가입에 실패했습니다." + error);
					}
				});
			}
		</script>
	</div>
		<script type="text/javascript">
		
			function upload() {
				  const imageInput = $("#imageInput")[0];
				  // 파일을 여러개 선택할 수 있으므로 files 라는 객체에 담긴다.
				  console.log("imageInput: ", imageInput.files)
	
				  if(imageInput.files.length === 0){
				    alert("파일은 선택해주세요");
				    return;
				  }
	
				  const formData = new FormData();
				  formData.append("image", imageInput.files[0]);
	
	
				  $.ajax({
				    type:"POST",
				    url: "/temp/api/upload/image/v1",
				    processData: false,
				    contentType: false,
				    data: formData,
				    success: function(rtn){
				      const message = rtn.data.values[0];
				      console.log("message: ", message)
				      $("#resultUploadPath").text(message.uploadFilePath)
				    },
				    err: function(err){
				      console.log("err:", err)
				    }
				  })
				}
		</script>
		
	</body>
</html>