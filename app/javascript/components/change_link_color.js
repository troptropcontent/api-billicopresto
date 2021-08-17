function changeLinkColor() {

	var currentUrl = window.location.href;
	console.log(currentUrl.toString());

	// var profileUrl = document.getElementById("profile").href;
	var profile = document.getElementById('dashboard');

	// var budgetUrl = document.getElementById("budget").href;
	var budget = document.getElementById("budget");

	// var receiptsUrl = document.getElementById("receipts").href;
	var receipts = document.getElementById("receipts");

	// var scanUrl = document.getElementById("scan").href;
	var scan = document.getElementById("scan");

	// var promoUrl = document.getElementById("promo").href;
	var promo = document.getElementById("promo");

	// var warrantiesUrl = document.getElementById("warranties").href;
	var warranties = document.getElementById("warranties");

	if (currentUrl.includes("/receipts")) {
		receipts.classList.add("active");
	}
	else {
		profile.classList.add("active");
	}
}

export { changeLinkColor }