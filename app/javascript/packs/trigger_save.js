function initTriggerSave() {
	let artwork_list = document.getElementsByName("artwork[homepage_featured]");
	let artist_list = document.getElementsByName("artist[homepage_featured]");

	artist_list.forEach((artist, index) => {
		artist.addEventListener( 'change', function() {
		    const form = document.getElementById(`submit-${this.id}`);
			form.submit()
		});	
	}) 

	artwork_list.forEach((artwork, index) => {
		artwork.addEventListener( 'change', function() {
		    const form = document.getElementById(`submit-${this.id}`);
			form.submit()
		});	
	}) 
}



export default initTriggerSave()