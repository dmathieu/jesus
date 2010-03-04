require 'init'

require 'rack/test'
require 'spec'
require 'mocha'
require 'spec/autorun'
require 'spec/interop/test'

# set test environment
set :environment, :test
set :run, false
set :raise_errors, true
set :logging, false

# Set the application
module Jesus::Spec
  def app
    @app ||= Sinatra.new Jesus::Server
  end
end
