var request = require('request');
var jsdom = require('jsdom');

var _ = require('underscore');
var $ = require('jquery');

//var parser = require('./parser');
//var machine = require('./machine');

var AU = AU || {};

var Events = AU.Events = {
	on : function(){},
	off : function(){},
}

var Machine = AU.Machine = function(attributes, options) {
	this.initialize.apply(this, arguments);
};

_.extend(Machine.prototype, Events, {
	// variables	
	// set the url to fetch
	url : '',

	// current url
	_url : '',

	//last result
	result : null,

	// functions
	// Initialize function 
	initialize : function(){},

	// Get the current URL where we are working
	currentUrl : function(){
		return this._url;
	},
	// make a get request on url
	getRequest : function(){
		var dfd = $.Deferred();
		// var result = null;
		request(this.url, function(error, res, body){
			if (error) {
				// error happened
				dfd.reject(error);

			} else if (res.statusCode == 200) {
				dfd.resolve(body);
			}
		});
		// console.log("exit");
		return dfd.promise();
	},
	// make a post request on url
	postRequest : function(){

	},
	// Set cookie jar
	setCookieJar : function(){

	},
	// set the url
	setUrl : function(url){
		this.url = url;
		this._url = this.url;
		return;
	},
});

// This will be the parser api for doing a lot of things
var Parser = AU.Parser = function(attributes, options) {
	this.initialize.apply(attributes);
}

_.extend(Parser.prototype, Events, {
	body : null,

	initialize : function(){},
	workOn : function(body) {
		console.log(body);
	},
});

exports.Parser = Parser;
exports.Machine = Machine;