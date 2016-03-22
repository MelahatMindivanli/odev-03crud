class MoviesController < ApplicationController
  before_action :set_movie, only: [:show,:edit, :update, :destroy]
  #GET /movies
  def index
  @movies=Movie.all
  end
  #GET /movies/1
  def show
  @movies=Movie.find(params[:id])
  end
  #GET /movies/new
  def new
  @movies = Movie.new
  end
  #POST /movies
  def create
     @movies = Movie.new(movie_params)
       if @movies.save
       redirect_to movies_path(@movies), notice: 'Film oluşturuldu!'
       else
          render "new"
       end
   end
  #GET /movies/1/edit
  def edit

  end

  #PUT/PATCH /movies/:id
  def update
    @movies=Movie.find(params[:id])
    if @movies.update(movie_params)
      redirect_to @movies , notice: "Film düzenlendi!"
    else render "edit"
    end
  end

  #DELETE /movies/1
  def destroy
  @movies.destroy
  redirect_to @movies, notice: "Film silindi!"
  end

  def set_movie
        @movies = Movie.find(params[:id])
  end

  def movie_params
  params.require(:movie).permit(:id,:title,:description,:director,:country,:date)
  end
end
