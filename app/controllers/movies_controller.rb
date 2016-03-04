class MoviesController < ApplicationController

  def index

  end

  def search
    response = HTTParty.get(search_url)
    @movies = response.code == 200 ? JSON.parse(response.body) : []
    render :action => 'index'
  end

  def movie_params
    params.permit(:query)
  end

  private

  def search_url
    "http://www.omdbapi.com/?s=#{movie_params["query"]}"
  end
end
