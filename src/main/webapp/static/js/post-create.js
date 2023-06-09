/**
 * 게시판 지현
 * post-create
 * create
 * modify
 */
document.addEventListener('DOMContentLoaded', () => {
	
		let select = document.getElementById('select');
		select.addEventListener('change', function(){
			document.getElementById('hrs_hd').innerHTML
			= select.options[select.selectedIndex].value;
		})
		
	
});