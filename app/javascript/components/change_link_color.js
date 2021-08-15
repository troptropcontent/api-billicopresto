function changeLinkColor() {

	var currentUrl = window.location.href;

	var profileUrl = document.getElementById("profile").href;
	var profile = document.getElementById("profile");

	var budgetUrl = document.getElementById("budget").href;
	var budget = document.getElementById("budget");

	var receiptsUrl = document.getElementById("receipts").href;
	var receipts = document.getElementById("receipts");

	var scanUrl = document.getElementById("scan").href;
	var scan = document.getElementById("scan");

	var promoUrl = document.getElementById("promo").href;
	var promo = document.getElementById("promo");

	var warrantiesUrl = document.getElementById("warranties").href;
	var warranties = document.getElementById("warranties");

	if (currentUrl === profileUrl) {
		profile.classList.add("active");
	}
	else if (currentUrl === budgetUrl) {
		budget.classList.add("active");
	}
	else if (currentUrl === receiptsUrl) {
		receipts.classList.add("active");
	}
	else if (currentUrl === scanUrl) {
		scan.classList.add("active");
	}
	else if (currentUrl === promoUrl) {
		promo.classList.add("active");
	}
	else if (currentUrl === warrantiesUrl) {
		warranties.classList.add("active");
	}
	else {
		console.log("no active link")
	}
}

export { changeLinkColor }