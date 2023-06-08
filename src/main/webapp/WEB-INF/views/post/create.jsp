<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Shape</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<script src="../static/summernote/lang/summernote-ko-KR.js"></script>
<script>
	$(document)
			.ready(
					function() {
						$('#summernote')
								.summernote(
										{
											lang : 'ko-KR', // default: 'en-US'
											height : 300, // set editor height
											minHeight : null, // set minimum height of editor
											maxHeight : null, // set maximum height of editor
											focus : true, // set focus to editable area after initializing summernote
											toolbar : [
													// [groupName, [list of button]]
													[ 'fontname',
															[ 'fontname' ] ],
													[ 'fontsize',
															[ 'fontsize' ] ],
													[
															'style',
															[
																	'bold',
																	'italic',
																	'underline',
																	'strikethrough',
																	'clear' ] ],
													[
															'color',
															[ 'forecolor',
																	'color' ] ],
													[ 'table', [ 'table' ] ],
													[
															'para',
															[ 'ul', 'ol',
																	'paragraph' ] ],
													[ 'height', [ 'height' ] ],
													[
															'insert',
															[ 'picture',
																	'link',
																	'video' ] ],
													[
															'view',
															[ 'fullscreen',
																	'help' ] ] ],
											fontNames : [ 'Arial',
													'Arial Black',
													'Comic Sans MS',
													'Courier New', '맑은 고딕',
													'궁서', '굴림체', '굴림', '돋움체',
													'바탕체' ],
											fontSizes : [ '8', '9', '10', '11',
													'12', '14', '16', '18',
													'20', '22', '24', '28',
													'30', '36', '50', '72' ]
										});
					});
</script>
<script type="text/javascript">
document.addEventListener('DOMContentLoaded', () => {
	
		let select = document.getElementById('select');
		select.addEventListener('change', function(){
			document.getElementById('hrs_hd').innerHTML
			= select.options[select.selectedIndex].value;
		})
		
	
});
</script>
</head>
<body>
	<div class="container">
		<header class="my-2 p-5 text-center">
			<h1>게시글 작성</h1>
		</header>

		<main class="border bg-body rounded shadow-sm">
			<div class="card">
				<form method="post">
					<div class="card-body">
						<div class="my-2">
							<label class="form-label" for="hrs_hd">말머리</label>
							<!-- !!!!!!말머리 번호 전달!!!!!! -->
							<select class="form-select" id="select" name="select">
								<option selected disabled="disabled">말머리를 선택해주세요.</option>
								<option value="모임 후기">모임 후기</option>
								<option value="사담">사담</option>
								<option value="기타">기타</option>
							</select>
							<textarea class="form-control d-none" id="hrs_hd" name="hrs_hd"></textarea>
						</div>

						<div class="my-2">
							<label class="form-label" for="title">제목</label> <input
								class="form-control" type="text" id="title" name="title"
								required autofocus />
						</div>
						<div class="my-2">
							<label class="form-label" for="summernote">내용</label>
							<textarea class="form-control" id="summernote" name="content"
								required></textarea>
						</div>
						<div class="my-2">
							<label class="form-label" for="author">작성자 아이디</label> <input
								class="form-control" type="text" id="author" name="author"
								required />
						</div>
					</div>
					<div class="d-grid gap-2 d-md-flex justify-content-md-end">
						<input class="form-control btn btn-outline-warning" type="submit"
							value="작성 완료" />
						<c:url var="postList" value="/post/list" />
						<button onclick="location.href='${ postList }'"
							class="btn btn-warning" type="button">목록</button>
					</div>
				</form>

			</div>
		</main>
	</div>
</body>
</html>
<%@ include file="../common/footer.jsp"%>