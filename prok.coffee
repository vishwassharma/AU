_ = require 'underscore'
$ = require 'jquery'
Browser = require 'zombie'
events = require 'events'

# evt = new events.EventEmitter
# evt.on 'hello', ->
# 	console.log 'yuohoo'

# evt.emit 'hello'

class IIMJobs

	_.extend @::, new events.EventEmitter

	constructor : () ->
		@initialize arguments...

	initialize : (options) ->
		@on 'hello' , @test

	test: () ->
		console.log "praise"

X = new IIMJobs()
X.emit('hello')