/**
 * meet-summernote.js
 * create, update
 */
/* summernote 편집기 그거 도구박스 */
$(document)
	.ready(
		function() {
			$('#summernote')
				.summernote(
					{
						lang: 'ko-KR', // default: 'en-US'
						height: 300, // set editor height
						minHeight: null, // set minimum height of editor
						maxHeight: null, // set maximum height of editor
						focus: false, // set focus to editable area after initializing summernote
						toolbar: [
							// [groupName, [list of button]]
							['fontname',
								['fontname']],
							['fontsize',
								['fontsize']],
							[
								'style',
								[
									'bold',
									'italic',
									'underline',
									'strikethrough',
									'clear']],
							[
								'color',
								['forecolor',
									'color']],
							['table', ['table']],
							[
								'para',
								['ul', 'ol',
									'paragraph']],
							['height', ['height']],
							[
								'view',
								['fullscreen',
									'help']]],
						fontNames: ['Arial',
							'Arial Black',
							'Comic Sans MS',
							'Courier New', '맑은 고딕',
							'궁서', '굴림체', '굴림', '돋움체',
							'바탕체'],
						fontSizes: ['8', '9', '10', '11',
							'12', '14', '16', '18',
							'20', '22', '24', '28',
							'30', '36', '50', '72']
					});
		});
