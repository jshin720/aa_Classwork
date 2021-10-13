class BandController < ApplicationController

    def index
      @band = Bands.all
      render :index
    end

    def create
      @band = Band.new(bands_params)
      if @band.save
          redirect_url band_url(@band)
      else
        render :index
      end
    end

    def new
      @band = Bands.new
      render :new
    end

    def edit
      @band = Band.find(params[:id])
        render :edit
    end
    
    def show
      @band = Band.find(params[:id])
      render :show
    end

    def update
      @band = Band.find(params[:id])

      if @band.update(bands_params)
        redirect_url user_url(band)
      else
        render json band.error.full, status: 422
      end
    end

    def destroy
      band = Band.find(params[:id])
      band.destroy
      redirect_url bands_url
    end

    def bands_params
      params.require(:band).permit(:name)
    end

end
