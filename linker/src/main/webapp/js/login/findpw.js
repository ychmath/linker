function showResult(message, success) {
	if (message) {
		alert(message);
		if (success) {
			location.href = "/loginform";
		}
	}
}