document
	.getElementById("title_validation")
	.addEventListener(
		"submit",
		function(event) {
			var title = document.getElementById("title").value;
			if (title.trim() === "") {
				document.getElementById("titleError").style.display = "block";
				event.preventDefault(); // 폼 제출 방지
			} else {
				document.getElementById("titleError").style.display = "none";
			}
		});