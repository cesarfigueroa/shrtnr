module Shrtnr
  class Base < Sinatra::Base
    set :erb, :escape_html => true
    set :root, Dir.pwd
    set :show_exceptions, :after_handler
    set :static_cache_control, [:public, :max_age => (60 * 60)]
    set :views, 'app/views'

    enable :logging, :method_override, :static
    disable :dump_errors

    configure :test do
      disable :show_exceptions
    end

    error ActiveRecord::RecordNotFound do
      send_file 'public/404.html', :status => 404
    end

    not_found do
      send_file 'public/404.html', :status => 404
    end

    helpers Helpers
  end
end
