
promise = require 'when'
scrape = require 'scrape'
api = 'https://www.nuget.org/profiles/:user'

getUrl = (user = '') ->
	api.replace ':user', user

packages = (user) ->

	deferred = do promise.defer

	request = ->

		++requests

		url = getUrl user
		scrape.request url, (err, $) ->
			process err, $

	process = (err, $) ->

		stats = $ '.stat-number'
		count = +stats[1].innerHTML

		if err
			deferred.reject err

		else
			deferred.resolve count

	# go!
	do request

	# return
	deferred.promise

module.exports = packages