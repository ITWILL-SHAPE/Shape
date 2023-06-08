/**
 * 게시판
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