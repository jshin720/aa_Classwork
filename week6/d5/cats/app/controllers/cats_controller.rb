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

  def cats_params
    params.require(:cat).permit(:birth_date, :name, :color, :sex, :description, :age)

  end

end
