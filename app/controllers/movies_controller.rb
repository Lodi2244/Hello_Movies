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
