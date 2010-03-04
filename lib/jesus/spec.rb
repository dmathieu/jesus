#
# Instantiates the Sinatra application to allow us to run the tests
#
module Jesus::Spec
  def app
    @app ||= Sinatra.new Jesus::Server
  end
end