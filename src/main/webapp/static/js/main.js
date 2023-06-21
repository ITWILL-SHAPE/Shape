/**
 * main.js
 * 정지언
 */

     $(document).ready(function() {
      // 이미지 클릭 이벤트 처리
      $('.carousel-item img').click(function() {
        // data-link 속성 값 가져오기
        var link = $(this).data('link');
        // 링크로 이동
        window.location.href = link;
      });
    });