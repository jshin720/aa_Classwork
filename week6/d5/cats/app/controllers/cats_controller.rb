class CatsController < ApplicationController
  
  def index
    @cats = Cat.all 
    render :index
  end

  def show
    @cats = Cat.find(params[:id])
    render :show
  end

end
