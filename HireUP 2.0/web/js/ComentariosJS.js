$(document).ready(function () {
	$("#HideShow").click(function () {
		$(".tabComentar").toggle(200);
	});

	// Ocultar comentarios
	$("#hideComent").click(function () {
		$(".comentarioBody").toggle(500);
		if (
			document.getElementById("hideComent").className ===
			"fa-sharp fa-solid fa-eye-slash"
		) {
			document.getElementById("hideComent").className = "fa-solid fa-eye";
		} else {
			document.getElementById("hideComent").className =
				"fa-sharp fa-solid fa-eye-slash";
		}
	});
});
