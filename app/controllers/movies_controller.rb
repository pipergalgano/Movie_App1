class MoviesController < ApplicationController
	before_action :load_movie, :only => [:edit, :update, :show, :destroy]

	def index
		@movies = Movie.search_for(params[:query])
	end

	def show
	end

	def new
		@movie = Movie.new
	end

	def edit
	end

	def update
		@movie.update movie_params

		if @movie.save
			redirect_to @movie
		else
			render 'edit'
		end
  	end

  	def destroy
  		@movie.destroy
  		flash[:notice] = "The '#{@movie.title}' movie has been removed."

  		redirect_to movies_path
  	end


	def create
		@movie = Movie.new(movie_params)

		if @movie.save
			redirect_to @movie
		else
			render 'new'
		end
	end

private

def load_movie
	@movie = Movie.find(params[:id])
end

def movie_params
	params.require('movie').permit(:title, :description, :year_released)
end

end
