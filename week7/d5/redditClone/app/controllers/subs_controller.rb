class SubsController < ApplicationController

  def new
    @subs = Sub.new
    render :new
  end

  def index
    @sub = Sub.all
    render :index
  end

  def create
    @sub = Sub.new(sub_params)
    if @sub.save
      redirect_to subs_url
    else
      render :new
    end
  end

  def show
    @sub = Sub.find(params[:id])
    render :show
  end

  def edit
    @sub = Sub.find(params[:id])
    render :edit
  end

  def update
    @sub = Sub.find(params[:id])
    if @sub.update(sub_params)
      redirect_to 
    else

    end
  end

  def sub_params
    params.require(:sub).permit(:title, :description, :moderator_id)
  end

end
