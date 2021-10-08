class ArtworkSharesController < ApplicationController

  def index
    share = ArtworkShare.all
    render json: share
  end

  def show
    artshare = ArtworkShare.find(params[:id])
    render json: artshare
  end

 def create
      share = ArtworkShare.new(artwork_share_params)
      # replace the `user_attributes_here` with the actual attribute keys
      if share.save
        render json: share
      else
        render json: share.errors.full_messages, status: 422
      end
  end

    def destroy
      share = ArtworkShare.find(params[:id])
      share.destroy
      render json: share
  end

  def artwork_share_params
      params.require(:artwork_share).permit(:artwork_id, :viewer_id)
  end

end
