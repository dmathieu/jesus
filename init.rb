# We require the bundled gems
begin
  require File.expand_path('../.bundle/environment', __FILE__)
rescue LoadError
  require "rubygems"
  require "bundler"
  Bundler.setup
end

# We require the application
$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__) + '/lib')
require 'jesus/server'
require 'jesus/config'