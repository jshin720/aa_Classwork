class CatsController < ApplicationController
  
  def index
    @cats = Cat.all 
    render :index
  end

  def show
    @cats = Cat.find(params[:id])
    render :show
  end

  def new 
    @cats = Cat.new(cats_params)
    render :new
  end
  
  def update
    @cats = Cat.find(params[:id])
    if @cats.update(cat_params)
      redirect_to cat_url(@cats)
    else
      render json: @cats.errors.full_messages, status: 422
    end
  end

  def create
    @cats = Cat.find(params[:id])
    if @cats.save
      redirect_to cat_url(@cats)
    else
      render json: @cats.errors.full_messages, status: 422
    end
  end

  private
  def cats_params
    params.require(:cats).permit(:birth_date, :name, :color, :sex, :description, :age)
  end

end
