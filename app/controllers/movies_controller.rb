class MoviesController < ApplicationController
  before_filter :authenticate_admins, only: [:new]
  protect_from_forgery with: :null_session

  def index
    @movies = Movie.all
    session[:user_id] = 1
  end

  def new
    @movie = Movie.new
  end
  
  def create
    @movie = Movie.new(params[:movie])
    @movie.save
    redirect_to movies_path
  end

  private

  def authenticate_admins
    redirect_to movies_path if session[:user_id].nil?
  end
end
