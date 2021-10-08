class ArtworksController < ApplicationController
    def index
      artworks = Artwork.all
        render json: artworks 
    end

    def create
        # debugger
        artwork = Artwork.new(artwork_params)
        if artwork.save
          render json: artwork
        else
          render json: artwork.errors.full_messages, status: 422
        end
    end

    def show
        artwork = Artwork.find(params[:id])
        render json: artwork
    end

    def update
        artwork = Artwork.find(params[:id])

        if artwork.update(artwork_params)
            render json: artwork #updated artwork
        else
            render json: artwork.errors.full_messages, status: 422
        end 
    end

    def destroy
        artwork = Artwork.find(params[:id])
        artwork.destroy
        render json: artwork
    end
 
    def artwork_params
        params.require(:artwork).permit(:title, :artist_id, :image_url)
    end
end
