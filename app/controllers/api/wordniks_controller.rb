module Api
  class WordniksController < ApplicationController 

    def index
      @wordnik_variable = "jeans";  
  
      @resp = HTTParty.get("http://api.wordnik.com:80/v4/word.json/#{@wordnik_variable}/relatedWords?includeDuplicates=false&useCanonical=false&skip=0&limit=5&api_key=#{ENV['WORDNIK_KEY']}")
      @rhyme = HTTParty.get("http://api.wordnik.com/v4/word.json/#{@wordnik_variable}/relatedWords?useCanonical=false&relationshipTypes=rhyme&relationshipTypes=synonym&limitPerRelationshipType=10&api_key=#{ENV['WORDNIK_KEY']}")
      @synonym = HTTParty.get("http://api.wordnik.com/v4/word.json/#{@wordnik_variable}/relatedWords?useCanonical=false&relationshipTypes=synonym&limitPerRelationshipType=10&api_key=#{ENV['WORDNIK_KEY']}")
      @defined = HTTParty.get("http://api.wordnik.com/v4/word.json/#{@wordnik_variable}/definitions?limit=200&includeRelated=true&useCanonical=false&includeTags=false&api_key=#{ENV['WORDNIK_KEY']}")

      render json: @synonym
    end
  end
end