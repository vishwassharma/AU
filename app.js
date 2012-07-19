var AU = require('./AU');
// Url on which you will work
var url = "http://news.ycombinator.com/";
// Create a Machine Object
var machine = new AU.Machine();
machine.url = url;

// Make request
result = machine.getRequest();

parser = new AU.Parser();

result.then(function(val){
	// parse out stuff from the result
	parser.workOn(val);
}, function(error){
	console.log(error);
});