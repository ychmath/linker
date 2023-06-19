$(function() {
	// 권한 가져오기
	var role = $("#role").text();

	// 답글쓰기 버튼이 admin, seller 권한에만 보이게 함
	if (role == 'admin' || role == 'seller') {
		$("#replyButton").show();
	} else {
		$("#replyButton").hide();
	}

	// 해당하는 태그를 여기에 넣습니다.
	$("a[id]").click(function() {
		let no = $(this).attr("id");
		$.ajax({
			url: "/inquiry/delete",
			data: "inquirypostid=" + no,
			method: "delete",
		}).done(function() {
			location.href = "../inquiry";
		});
		return false; //하이퍼링크 이동x
	});

});