const displayInfo = document.getElementById('DisplayInfo');

window.addEventListener('message', (event) => {
	var data = event.data;
	if(data.action == 'setDisplayInfo') {
		displayInfo.innerText = data.time
	}
});
