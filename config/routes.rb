module Shrtnr
  module Routes
    def self.registered(app)
      app.use Bookmarks
    end
  end
end
