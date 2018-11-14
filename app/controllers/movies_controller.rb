class MoviesController < ApplicationController
  def search

  end

  def create
  	word = params[:word]
  	SearchMovie.new(word).perform
    @movies = Movie.where("title ILIKE ?", "%#{word}%")
    render :search
  end
end

private

#def poster_path
  #configuration = Tmdb::Configuration.new
  #configuration.base_url
#  configuration.secure_base_url
#  configuration.poster_sizes
#  configuration.save
#end
