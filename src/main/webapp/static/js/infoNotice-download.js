/**
 * infoNotice-download.js
 * download
 */

document.addEventListener('DOMContentLoaded', function() {
	
	$(document).ready(function() {
		$('a[name="file"]').on('click', function(e) {
			e.preventDefault();
			
			let nid = e.target.getAttribute('data-id');
			console.log(nid);
			
			$.ajax({
				url: '/shape/info/notice/download/' + nid,
				type: 'POST',
				cache: false,
				xhrFields: {
					responseType: "blob",
				},
			}).done(function (blob, status, xhr) {
				let fileName = e.target.innerText; // check for a filename
				
				if (window.navigator && window.navigator.msSaveOrOpenBlob) {
					window.navigator.msSaveOrOpenBlob(blob, fileName);
				} else {
					var URL = window.URL || window.webkitURL;
					var downloadUrl = URL.createObjectURL(blob);
					
					if (fileName) {
						var a = document.createElement("a");
						
						if (a.download === undefined) {
							window.location.href = downloadUrl;
						} else {
							a.href = downloadUrl;
							a.download = fileName;
						    document.body.appendChild(a)
						    a.click();
						}
					} else {
						window.location.href = downloadUrl;
					}
				}
			})
		});
		
		
	});
	
}); 