get = require '../nuget-count'

exports.nuget =

	success: (test) ->

		test.expect 1

		fn = (count) ->
			isMoreThan100 = count > 100
			test.equals isMoreThan100, true
			test.done()

		err = (e) ->
			test.ok false
			test.done()

		# username has >800 packages
		(get 'microsoft').then fn, err

	error: (test) ->

		test.expect 1

		fn = ->
			test.ok true
			test.done()

		# username doesn't exist and should throw an error
		(get 'ajkldanjkndjklfndjfnjkdsnfjrnfjkdndjkvnifsdvnfjkvnsrifrifnsermnerjifnerjfnjr').then (->), fn, (->)