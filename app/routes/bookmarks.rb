module Shrtnr
  module Routes
    class Bookmarks < Base
      get '/' do
        @bookmarks = Bookmark.all
        template :index
      end

      post '/bookmarks', :provides => :html do
        Bookmark.create(params[:bookmark])
        redirect back
      end

      post '/bookmarks', :provides => :json do
        @bookmark = Bookmark.create(params[:bookmark])
        @bookmark.to_json
      end

      delete '/bookmarks/:id', :provides => :json do
        Bookmark.find(params[:id]).destroy
      end

      # For use in the bookmarklet
      get '/bookmarks/add' do
        headers 'Access-Control-Allow-Origin' => '*'
        Bookmark.create(params[:bookmark])
      end

      get %r{/(?<slug>[^\W0Oo1ilL_]+)\z} do
        @bookmark = Bookmark.find_by_slug!(params[:slug])
        redirect @bookmark.url, 301
      end

      # get %r{/(?<slug>[^\W0Oo1ilL_]+)\+\z} do
      #   @bookmark = Bookmark.find_by_slug!(params[:slug])
      #   template :show
      # end
    end
  end
end
