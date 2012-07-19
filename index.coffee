_ = require 'underscore'
$ = require 'jquery'
Browser = require 'zombie'
events = require 'events'

class LinkedList

	_length : 0

	_head : null

	# add the node in a linked list
	add : (data) ->
		node =
			data:
				url : data["url"]
				name : data["name"]
				attr : data["attr"]
			next : null

		# if we have no head
		unless @_head
			@_head = node
		else
			# get the current head
			current = @_head

			# get the last node
			while current.next
				current = current.next

			# make the next of last node point to the new one
			current.next = node

		# increase the length of linked list
		@_length++

	addAll : (array) ->
		for each in array
			@add (each)
			
	getFirst : () ->
		# get last
		@_head

# IIMJOBs ka automation
class IIMJobs

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

	visit_login : (attr) =>
		console.log "Visit login"
		# console.log @browser.html()

	login : (attr) =>
		console.log "login"
		# fill the form
		@browser.
			fill("name", attr["name"]).
			fill("description", attr["description"]).
			pressButton "save", =>
				console.log "done login"

	logout : (attr) =>
		console.log "logout"


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
					console.log "life ends here"


portal = new IIMJobs()
# do login into the page

# Attributes of the job
attributes =
	name : 'MTS - Head - Learning & Development'
	description : """L&D Head (Manager) 

- We are looking for L&D Head for MTS (Mumbai). Internal designation would be Leda and reporting to HR Head for Mumbai circle. 

Location: Andheri East. 

Open to all industry experts. Send your CV to Purnendu.shekhar@mtsindia.in """


steps = new LinkedList() 

steps.add
		url : "http://dev.hirevoice.com:3333"
		name : "visit_login"
		attr : null

steps.add
		url : "http://dev.hirevoice.com:3333/jobs/add"
		name : "login"
		attr : attributes

steps.add
		url : "http://dev.hirevoice.com:3333/logout"
		name : "logout"
		attr : null

portal.mechanics steps.getFirst()
# portal.start()
# portal.mechanics(steps[0]["url"],  steps[0]["cb"])

# after login do some form filling 	
# portal.create_job(attributes)