module Api
  class FacesController < ApplicationController 
    def index
      require 'httparty'
      face_key = "e586216a45f49c338651d3a83de1f270";
      face_secret = "FHM-Rs37eCXZA9jTSSatWhlODmla8t1-";
      @face_variable_url_02 = "https://instagramimages-a.akamaihd.net/profiles/profile_328450763_75sq_1363465471.jpg"; 
      @face_variable_url_01 = "http://i.annihil.us/u/prod/marvel/i/mg/9/00/537bcb1133fd7.jpg"; 
      
      # Creates Face Id for First Image
      @face_01 = HTTParty.get("https://apius.faceplusplus.com/v2/detection/detect?url=#{@face_variable_url_02}&api_secret=#{ENV['FACES_SECRET_KEY']}&api_key=#{ENV['FACES_KEY']}&attribute=glass,pose,gender,age,race,smiling")  
      face_hash_01 = @face_01;
      # @face_id_01 = face_hash_01['face'][0]['face_id'];
      @face_id_01 = face_hash_01['face'];
      render json: @face_id_01
    end
  end
end





