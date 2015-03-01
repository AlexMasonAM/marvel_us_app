module Api
  class WordniksController < ApplicationController 

    def index
      @wordnik_variable = "hammer";  
      wordnik_key = "65ba378ed11d1ca3e940f001a620c978e87cfc704ecce75be";
      @resp = HTTParty.get("http://api.wordnik.com:80/v4/word.json/#{@wordnik_variable}/relatedWords?includeDuplicates=false&useCanonical=false&skip=0&limit=5&api_key=#{wordnik_key}")
      @rhyme = HTTParty.get("http://api.wordnik.com/v4/word.json/#{@wordnik_variable}/relatedWords?useCanonical=false&relationshipTypes=rhyme&relationshipTypes=synonym&limitPerRelationshipType=10&api_key=#{wordnik_key}")
      @synonym = HTTParty.get("http://api.wordnik.com/v4/word.json/#{@wordnik_variable}/relatedWords?useCanonical=false&relationshipTypes=synonym&limitPerRelationshipType=10&api_key=#{wordnik_key}")
      @defined = HTTParty.get("http://api.wordnik.com/v4/word.json/#{@wordnik_variable}/definitions?limit=200&includeRelated=true&useCanonical=false&includeTags=false&api_key=#{wordnik_key}")

      render json: @resp
    end
  end
end