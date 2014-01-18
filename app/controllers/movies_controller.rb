class MoviesController < ApplicationController
  before_filter :authenticate_admins, only: [:new]

  def index
    @movies = Movie.all
    session[:user_id] = 1
  end

  def new
    @movie = Movie.new
  end

  private

  def authenticate_admins
    redirect_to movies_path if session[:user_id].nil?
  end
end
