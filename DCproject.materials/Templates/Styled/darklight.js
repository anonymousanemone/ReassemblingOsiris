var darkened = false;
function toggle_darkness(){
	if(darkened)
		lighten();
	else
		darken();
}

function pset(prop, val){
	document.documentElement.style.setProperty(prop, val);
}

function lighten(){
	darkened = false;
	pset('transition', 'all 1s ease');
	pset('--terp-fg', 'var(--light-fg)');
	pset('--terp-bg', 'var(--light-bg)');
	pset('--terp-input', 'var(--light-input)');
	pset('--header-color', 'var(--light-header)');
	pset('--body-fg', 'var(--light-body-fg)');
	pset('--body-bg', 'var(--light-body-bg)');
}
function darken(){
	darkened = true;
	pset('transition', 'all 1s ease');
	pset('--terp-fg', 'var(--dark-fg)');
	pset('--terp-bg', 'var(--dark-bg)');
	pset('--terp-input', 'var(--dark-input)');
	pset('--header-color', 'var(--dark-header)');
	pset('--body-fg', 'var(--dark-body-fg)');
	pset('--body-bg', 'var(--dark-body-bg)');
}
