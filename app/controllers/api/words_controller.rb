module Api
  class WordsController < ApplicationController  
    
    def index
      # require 'open-uri'

    # These code snippets use an open-source library. http://unirest.io/ruby
    word_01 = "jean"

    response = Unirest.get "https://wordsapiv1.p.mashape.com/words/#{word_01}/rhymes",
     headers:{
      "X-Mashape-Key" => ENV['MASHAPE_KEY'],
      "Accept" => "application/json"
    }
    response = response.to_json;
    response = JSON.parse(response)
    response_all = response['body']['rhymes']['all']
    response_one = response['body']['rhymes']['all'].sample
    responses = []
      
    render json: response_all
    end
  end
end

