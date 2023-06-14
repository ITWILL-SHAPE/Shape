/**
 * infoQnA Main Paging
 * qna, postInfo list, search
 */

document.addEventListener('DOMContentLoaded', () => {
	
    const actionForm = $("#actionForm");
    
    $(".page-link").on("click", function(e){
		e.preventDefault();
		
		const targetPage = $(this).attr("href");
		console.log(targetPage);
		
		actionForm.find("input[name='pageNum']").val(targetPage);
		actionForm.find("input[keyword='keyword']").val(keyword);
		actionForm.submit();
	})
    
});