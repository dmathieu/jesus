require 'init'

require 'rack/test'
require 'spec'
require 'mocha'
require 'spec/autorun'
require 'spec/interop/test'

# Set the application
module Jesus::Spec
  def app
    @app ||= Sinatra.new Jesus::Server
  end
end
