DS = require('./AU').DataStructure
Browzy = require('./AU').Browzy

class IIMJobs extends Browzy

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

	endLife : () ->
		process.exit(1)

portal = new IIMJobs()
# do login into the page

# Attributes of the job
attributes =
	name : 'Paid Search Manager - Online Travel/eComm'
	description : """MANAGER - PAID SEARCH - Gurgoan 

Hays, a global leader in specialist recruitment, is an expert in recruiting qualified & skilled professionals. We have a global presence in 31 countries with 247 offices. 

Our client, an Online Travel Organisation is rapidly expanding its operations in India. We have partnered with them for their hiring plans to assist growth. 

We are looking for a MANAGER - PAID SEARCH for Gurgaon. 

- The main responsibilities will be to lead a team for development, execution and management of PPC marketing strategy. 

- 6-8 years of experience in handling Pay Per Click Marketing strategies. Exposure to web analytics & overall online marketing is desirable. You need to have pursued qualifications / certifcations in design from Premiere School. 

To apply, kindly share your Cv with us, by writing to shweta.raghuwanshi@hays.in and we will connect with you immediately. """


steps = new DS.LinkedList() 
# console.log DS
# console.log steps

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