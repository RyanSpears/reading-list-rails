class GenresController < ApplicationController
  def index
    render json: Genre.all, status: 200
  end

  def create
    genre = Genre.new(genre_params)

    if genre.save
      render json: genre, status: 201, location: genre
    else
      render json: genre.errors, status: 422
    end
  end

  def genre_params
    params.require(:genre).permit(:name)
  end
end