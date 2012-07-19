var _ = require('underscore');
var Events = require('events').EventEmitter;
var Browser = require("zombie");

var IIMJobs = function(attributes, options){
	this.browser = new Browser();
	
	this.initialize.apply(attributes);
	return {
		url : "http://dev.hirevoice.com:3333/",
		initialize : function(){
			console.log(this);
		},		
	}
}


// function iimjobs(attributes)
// 	browser.visit("http://www.iimjobs.com/recruiter/login.php", function () {

// 	  // Fill email, password and submit form
// 		browser.
// 			fill("email", "vishwas@logicstick.com").
// 			fill("password", "olive1986").
// 			pressButton("Submit", function() {

// 				// Form submitted, new page loaded.
// 				// assert.ok(browser.success);
// 				// assert.equal(browser.text("title"), "Welcome To Brains Depot");
// 				browser.visit("http://www.iimjobs.com/recruiter/jobpost.php",function(){
// 					// assert.equal(browser.text("title"), "Welcome To Brains Depot");
// 					console.log(browser.text("title"));
// 					browser.
// 						fill("subject",attributes['subject']).
// 						fill("otherslocation", attributes['otherslocation']).
// 						select("category", attributes["category"]).
// 						select("minexp", attributes["minexp"]).
// 						select("maxexp",  attributes["maxexp"]).
// 						fill("introtext", attributes["introtext"]).
// 						// fill tags
// 						fill("tag1", attributes["tag1"] ).
// 						fill("tag2", attributes["tag2"]).
// 						pressButton("submit",function(){
// 							console.log(browser.text("title"));
// 							browser.visit("http://www.iimjobs.com/recruiter/controller.php?flowtype=5",function(){

// 							});
// 						});
// 				});
// 			});

// 	});

attributes = {
	subject : "Cyber Threat Management",
	otherslocation : "Bangalore",
	category : "15",
	minexp : "3",
	maxexp : "5",
	introtext: "We have an opening with one of the Leading Financial Institution in Mumbai for the VP role. Please find below the JD. Position Title: VP Funding ",
	tag1 : "Computer Security",
	tag2 : "Infrastructure",
}

a = new IIMJobs();
a.on("hello", function(){
	console.log("registered the event");
})