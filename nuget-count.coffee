
promise = require 'when'
scrape = require 'scrape'
api = 'https://www.nuget.org/profiles/:user'

getUrl = (user = '') ->
	api.replace ':user', user

packages = (user) ->

	deferred = do promise.defer

	request = ->

		url = getUrl user
		scrape.request url, process

	process = (err, $) ->

		stats = $ '.stat-number'

		if err
			deferred.reject err

		else if not stats[0]
			deferred.reject 'User does not exist'

		else
			deferred.resolve +stats[0].children[0].data

	# go!
	do request

	# return
	deferred.promise

module.exports = packages