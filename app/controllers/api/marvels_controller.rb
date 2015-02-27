module Api
  class MarvelsController < ApplicationController  
 
    def show

      # parameters = { term: params[:term], limit: 1 }
      client = Marvelite::API::Client.new(:public_key => ENV['MARVEL_KEY'], :private_key => ENV['MARVEL_SECRET']).characters(:limit => 100, :offset => 0, :orderBy => 'name').to_json
      client = JSON.parse(client)
      chars = []
      client['data']['results'].each do |result|
        chars << {
          # name: "Alex",
          name: (result['name']),
          thumbnail: (result['thumbnail']['path'].gsub('marvel.dl.llnw.net', 'i.annihil.us') + '/standard_xlarge.jpg')
        }
      end

      # render json: client
      render json: {results: chars}
    end
  end
end