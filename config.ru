#!/usr/bin/env ruby
require 'logger'
require 'init'

# We start the server
use Rack::ShowExceptions
run Jesus::Server.new
