require 'themoviedb'

#Rails.application.credentials.dig(:api_key_tmdb)
Rails.application.credentials.dig(:api_read_access_token_tmdb)

#Tmdb::Api.key(Rails.application.credentials[:api_read_access_token_tmdb])
Tmdb::Api.key(Rails.application.credentials[:api_key_tmdb])

class SearchMovie
	def initialize(args)
	  @args = args
	end

	def perform
	  @give = Tmdb::Movie.find(@args)
	  puts @give.size
	  i = 0
	  while i < @give.size
       @title = @give[i].title
       @director = director_name(i)
       @release_date = @give[i].release_date
       @poster_path = @give[i].poster_path
       save
       i += 1
	  end
	end

	def save
	  movie = Movie.new
	  movie.title = @title
	  movie.director = @director
	  movie.realease_date = @release_date
	  movie.save
	end

	private

	def director_name(i)
        crew = Tmdb::Movie.credits(@give[i].id).flatten
	  	j = 0
	  	while j < 5
	  	  if crew[5][j].nil?
	  	      j += 1
	  	  else
	  	  	if crew[5][j]['job'] == 'Director'
	  		  director = crew[5][j]['name']
	  		  j += 1
	  	    else
	  	  	  j += 1
	  	    end
	  	  end
	  	return director
	  	end
	end
end
