module Api
  class InstagramsController < ApplicationController 

    def index
      ig_username = "lovenicolelemoine";
      require 'httparty'
      @resp= HTTParty.get("https://api.instagram.com/v1/users/search?q=#{ig_username}
                          &client_id=#{ENV['IG_KEY']}")
      # photo_hash = @resp['data'][0]['profile_picture']
      photo_hash = @resp['data'][0]
      # @photo = photo_hash['images']['standard_resolution']['url']
      # @caption = photo_hash['caption']['text']
      # @link = photo_hash['link']

      # render json: @resp
      render json: photo_hash
    end
  end
end

