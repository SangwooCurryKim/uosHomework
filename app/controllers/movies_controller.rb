class MoviesController < ApplicationController
    @@api_url='http://www.omdbapi.com/?t='
    
    def index
        @allMovie = Movie1.all
    end
    
    def search
        require('json')
        require('open-uri')
        
        @movie_title=params[:title]
        
        movie_search=@@api_url+@movie_title.to_s
        
        open_page=open(movie_search)
        movie_info = open_page.read
        movie_hash = JSON.parse(movie_info)
        
        @newMovie = Movie1.new
        @newMovie.title = movie_hash["Title"]
        @newMovie.year = movie_hash["Year"]
        @newMovie.poster = movie_hash["Poster"]
        @newMovie.director = movie_hash["Director"]
        @newMovie.save
        
        redirect_to '/index'
    end
    
    def show
        @thisMovie = Movie1.find(params[:id])
    end
    
    def delete
        @deleteMovie = Movie1.find(params[:id])
        @deleteMovie.destroy
        
        redirect_to '/index'
    end
    
    
    
  
    
    
end
