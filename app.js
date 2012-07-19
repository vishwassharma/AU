var Browser = require("zombie");
var assert = require("assert");

// Load the page from localhost
browser = new Browser()
var url = "http://dev.hirevoice.com:3333/";
var url_view = "http://dev.hirevoice.com:3333/jobs";
var url_post = "http://dev.hirevoice.com:3333/jobs/add";


// browser.visit(url).
// then(function(){
// 	console.log("step 1")
// 	browser.visit(url_view).
// 	then(function(){
// 		console.log("step 2");
// 		browser.visit(url_post).
// 			then(function(){
// 				console.log("step 3");
// 				console.log(browser.success);
// 			});
// 	});
// }).
// fail(function(){

// });
browser
  .visit(url) // Step 1, open a page
  .then(function() {
    // Step 2, fill-in the form
    // browser.fill("Email", "armbiter@example.com");
    // browser.fill("Password", "b100d");
    console.log(browser.location.pathname);
  });
browser
	.visit(url_view)
	  .then(function() {
	    // Step 3, resolve the next promise with this value.
	    console.log(browser.location.pathname);
	    return "OK";
	  });
browser
	  .visit(url_post)
	  .then(function(){
	  	console.log(browser.location.pathname);
	  });

// browser.visit(url).
// then(function(){
// 	console.log("step 1")
// 	return browser.visit(url_view);
// }).then(function(value){
// 	console.log(value);
// 	console.log(browser.location.pathname);
// 	return browser.visit(url_post);
// }).then(function(value){
// 	console.log(value);
// 	console.log(browser.location.pathname);
// 	return;
// }).then(function(){
// 	console.log("process ends");
// }).
// fail(function(error){
// 	console.log()
// });