// Print all of the news items on hackernews
var request = require('request');
var jsdom = require('jsdom');

//
var AU = require('./AU');


var url = "http://www.indiajs.com";
// Create a object
var x = new AU.Machine();
x.url = url;

// Make request
result = x.getRequest();
result.then(function(val){
	console.log(val);
}, function(error){
	console.log(error);
});