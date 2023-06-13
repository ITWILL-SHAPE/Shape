/**
 * profileModify.jsp 에서 사용
 */
document.addEventListener('DOMContentLoaded', () => {
	function uploadProfileImage(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('.profile-image').attr('src', e.target.result);
			};

			reader.readAsDataURL(input.files[0]);
		}
	}

	$(document).ready(function() {
		$('#profile-upload').on('change', function() {
			uploadProfileImage(this);
		});
	});

});