module Shrtnr
  module Middleware
    def self.registered(app)
      app.use Rack::Cache
      app.use Rack::Deflater
      app.use Rack::Session::Cookie,
        :expire_after => (60 * 60 * 24 * 365),
        :key => 'shrtnr.session',
        :path => '/',
        :secret => ENV['SESSION_SECRET']
    end
  end
end
