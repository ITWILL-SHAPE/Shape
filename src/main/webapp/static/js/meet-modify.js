/**
 * meet-modify.js
 * 정지언
 */

// 카테고리 select value 설정
var meetCategory = "${meet.category}"; // 서버에서 가져온 값
var categorySelect = document.getElementById("category");

for (var i = 0; i < categorySelect.options.length; i++) {
  if (categorySelect.options[i].value === meetCategory) {
    categorySelect.options[i].selected = true;
    break;
  }
categorySelect.disabled = true; // 셀렉트 할 수 없게 하는 코드

}

// sido select value 설정
var meetSido = "${meet.sido}";
var sidogunguSelect = document.getElementById("sido");

for (var i = 0; i < sidogunguSelect.options.length; i++) {
  if (sidogunguSelect.options[i].value === meetSido) {
    sidogunguSelect.options[i].selected = true;
    break;
  }
}

// sigungu select value 설정
var meetSigungu = "${meet.sigungu}";
var sidogunguSelect = document.getElementById("sigungu");

for (var i = 0; i < sidogunguSelect.options.length; i++) {
  if (sidogunguSelect.options[i].value === meetSigungu) {
    sidogunguSelect.options[i].selected = true;
    break;
  }
}

// mt_cost_info select value 설정
var meetCostInfo = "${meet.mt_cost_info}";
var mtCostInfoSelect = document.getElementById("mt_cost_info");

for (var i = 0; i < mtCostInfoSelect.options.length; i++) {
  if (mtCostInfoSelect.options[i].value === meetCostInfo) {
    mtCostInfoSelect.options[i].selected = true;
    break;
  }
}

