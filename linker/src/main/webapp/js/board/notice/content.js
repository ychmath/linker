$(function() {
	$("a[id]").click(function() {
		// a[id]: a 태그 중에서 'id' 속성을 가진 모든 요소들을 선택하는 것을 의미
		let no = $(this).attr("id"); //삭제하려는 글번호. attr(): 선택된 요소의 속성 값을 가져오거나 설정하는 메소드
		$.ajax({
			url: "/admin/notice/delete",
			data: "noticepostid=" + no,
			method: "delete",
		}).done(function() {
			location.href = "/notice/notice";
		});
		return false; //하이퍼링크 이동 x
	}); //click
});