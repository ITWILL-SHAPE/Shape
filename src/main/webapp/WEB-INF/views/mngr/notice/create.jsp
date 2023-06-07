<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../../common/mngr_sidebar.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<!-- 반응형 웹 페이지 -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<!-- css -->
		<link
			href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
			rel="stylesheet"
			integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
			crossorigin="anonymous">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
		<!-- <link rel="stylesheet" href="../static/css/common.css"/> -->
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/css/common.css"/>
		<!-- icon -->
		<link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/static/images/common/favicon.ico">
		
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
		const changeHd = (target) => {
			const hd = target.value;
			console.log(target.value);
			document.getElementById('textarea#hrs_hd').innerText = hd;
		}
		
	});
	</script>
	</head>
	<body>
		<div class="container-fluid">
		<header class="my-2 p-5 text-center">
			<h1>Notice Create</h1>
		</header>

		<main class="my-2">
			<div class="card">
				<form method="post">
					<div class="card-body">
						<div class="my-2">
							<label class="form-label" for="title">제목</label> 
							<input class="form-control" type="text" id="title" name="title"
								required autofocus />
						</div>
						<div class="my-2">
							<label class="form-label" for="summernote">내용</label>
							<textarea class="form-control" id="summernote" name="content" required></textarea>
						</div>
						<div class="form-check"> <!-- 글 고정 체크박스 -->
							<label class="form-check-label" for="checkbox">고정</label>
							<input class="form-check-input" type=checkbox name="fix" id="checkbox" value="-1"/>
						</div>
					</div>
					<div class="card-footer my-2">
						<input class="form-control btn btn-outline-warning" type="submit" id="btnCreateNotice"
							value="작성 완료" />
					</div>
					<div class="my-2 text-center">
						<c:url var="postList" value="/mngr/notice/list" />
						<button onclick="location.href='${ postList }'"
							class="btn btn-warning" type="button">목록</button>
					</div>
				</form>
			</div>
		</main>

		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
			crossorigin="anonymous"></script>
	</div>
		
		
	</body>
</html>