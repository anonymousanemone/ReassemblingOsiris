function fix_height(){
	document.getElementById("gameport").style.setProperty("height", "auto");
}
window.addEventListener('scroll', fix_height);
