nuget-count
====================

[![Build Status](https://travis-ci.org/eighttrackmind/nuget-count.png)](https://travis-ci.org/eighttrackmind/nuget-count.png)
Fetch a user's package count from Nuget

## Usage

```coffee
get = require 'nuget-count'

success = (count) -> ...
error = (err) -> ...

(get 'someUserName').then success, error
```

## Features

- Uses promises

# Implementation notes

- Uses scraping (:[) because Nuget has no API.
- Because of the scraping approach, we cannot differentiate between user that exist but have no repos, and users that don't exist. Either will return a rejected promise.

## Supported environments

- Node
- CommonJS