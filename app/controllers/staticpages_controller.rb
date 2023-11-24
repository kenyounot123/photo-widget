class StaticpagesController < ApplicationController

    def index
        flickr = Flickr.new
        
        if params[:user_id].blank?
            @photos = flickr.photos.getRecent
        else
            @photos = flickr.photos.search(user_id: params[:user_id])
        end

    end

end
