<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- <%@ include file="../common/header.jsp"%> --%>
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
</head>
<body>
	<div class="container-fluid">
		<header class="my-2 p-5 text-center">
			<h1>게시글 수정</h1>
		</header>

		<main class="my-2">
			<div class="card">
				<form method="post">
					<div class="card-body">
						<div class="my-2">
							<label class="form-label" for="hrs_hd">말머리</label>
							<!-- !!!!!!말머리 번호 전달!!!!!! -->
							<select id="hrs_hd" class="form-select"
								aria-label="Default select example">
								<option selected>말머리를 선택해주세요.</option>
								<option name="hrs_hd" value="1">모임 후기</option>
								<option name="hrs_hd" value="2">사담</option>
								<option name="hrs_hd" value="3">기타</option>
							</select>
						</div>

						<div class="my-2">
							<label class="form-label" for="title">제목</label> <input
								class="form-control" id="title" name="title"
								value="${ post.title }" autofocus />
						</div>
						<div class="my-2">
							<label class="form-label" for="summernote">내용</label>
							<textarea class="form-control" id="summernote" name="content"
								required>${ post.content }</textarea>
						</div>
						<div class="my-2">
							<label class="form-label" for="author">작성자 아이디</label> <input
								class="form-control" id="author" value="${ post.author }"
								readonly />
						</div>
					</div>
					<div class="card-footer my-2">
						<div class="d-flex justify-content-center">
                        <button class="mx-1 btn btn-outline-danger" id="btnDelete">삭제</button>
                        <button class="mx-1 btn btn-outline-success" id="btnUpdate">업데이트</button>
                    </div>
					</div>
					<div class="my-2 text-center">
						<c:url var="postList" value="/post/list" />
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