var fullname = "Luke Ghenco"
var namedObject = {
	fullname: 'Johnathan Foster',
	prop: {
		fullname: 'Brad Pitt',
		getFullname: function() {
			return this.fullname;
		}
	}
}

console.log(namedObject.prop.getFullname()); // Brad Pitt

var testThis = namedObject.prop.getFullname;

console.log(testThis()); // Luke Ghenco

//1. create two divs on the top 5 rated projects show page and style them as 50% width, and float both
//left

//2. create a script on the top 5 rated page to send an ajax get to the appropriate project json view


//3. take the response and build an html rendering of the data

//4. append that html to the empty div.
