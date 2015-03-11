module Shrtnr
  class Application < Sinatra::Base
    register Middleware
    register Routes
  end
end
