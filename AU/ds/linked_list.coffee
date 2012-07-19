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

module.exports = LinkedList