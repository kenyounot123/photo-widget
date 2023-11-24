class StaticpagesController < ApplicationController

    def index
        flickr = Flickr.new
        begin
            if params[:user_id].empty?
                @photos = flickr.photos.getRecent
            else
                @photos = flickr.photos.search(user_id: params[:user_id])
            end
        rescue StandardError => e 
            flash[:alert] = "#{e.class}: #{e.message}. Please try again..."
            redirect_to root_path
        end
    end

end
