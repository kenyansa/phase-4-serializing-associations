class DirectorsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def index
    directors = Director.all
    render json: directors, include: ['movies', 'movies.reviews']
  end

  def show
    director = Director.find(params[:id])
    render json: director, include: ['movies', 'movies.reviews']
  end
  #This code tells AMS that we want to render information for the director, and to also include information for the movies associated with that director, and for the reviews associated with those movies.

  private

  def render_not_found_response
    render json: { error: "Director not found" }, status: :not_found
  end

end
