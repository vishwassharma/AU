_ = require 'underscore'
$ = require 'jquery'
Browser = require 'zombie'
events = require 'events'

# IIMJOBs ka automation
class Browzy

	_.extend @::, new events.EventEmitter

	# browser will the instance of zombie
	browser : null

	rank : 0

	toVisit : {}

	constructor : () ->
		# initialize the browser
		@browser = new Browser()
		@rank = 0
		@browser.site = "http://dev.hirevoice.com:3000"
		# a function that can be overridden
		@initialize arguments...

	initialize : (options) ->
		@on 'pageloaded', @pageloaded

	visit : (url, callback) ->
		@browser.visit(url, debug: false, callback)

	pageloaded : (attr...) =>
		console.log attr

	endLife : () ->
		console.log "LifeEnds"

	mechanics : (list) ->
		@browser.visit list.data['url'], =>
				name = list.data['name']
				attr = list.data['attr']
				@[name](attr)
				# next				
				list = list.next
				if (list)
					@mechanics(list)
				else
					@endLife()

module.exports = Browzy