_ = require 'underscore'
$ = require 'jquery'
Browser = require 'zombie'
Events = require('events').EventEmitter

class IIMJobs

	_.extend @::, Events.prototype

	constructor : () ->
		@initialize arguments...

	initialize : (options) ->
		console.log "Something here"

		console.log @



X = new IIMJobs()
