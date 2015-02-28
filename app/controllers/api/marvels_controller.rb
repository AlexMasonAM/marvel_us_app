module Api
  class MarvelsController < ApplicationController  

    # displays full list of names and urls from Marvel API to be used by Face++ for facial analysis
    def index
      client = Marvelite::API::Client.new(:public_key => ENV['MARVEL_KEY'], :private_key => ENV['MARVEL_SECRET'])
              .characters(:limit => 100, :offset => 1000, :orderBy => 'name').to_json
      client = JSON.parse(client)
      # chars = []
      # client['data']['results'].each do |result|
      #   chars << {
      #     # name: "Alex",
      #     name: (result['name']),
      #     thumbnail: (result['thumbnail']['path'].gsub('marvel.dl.llnw.net', 'i.annihil.us') + '/standard_xlarge.jpg')
      #   }
      # end

      render json: client
      # render json: {results: chars}
    end

    #displays a single marvel character

    def show
      client = Marvelite::API::Client.new(:public_key => ENV['MARVEL_KEY'], :private_key => ENV['MARVEL_SECRET'])
              .characters(:name => 'Spider-Man').to_json
      client = JSON.parse(client)
      comics = client['data']['results']
      render json: comics
    end
  end
end