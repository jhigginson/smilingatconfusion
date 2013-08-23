class AlbumsController < ApplicationController
  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)

    respond_to do |format|
      format.html do
        if @album.save
          flash[:notice] = "album has been created."
          redirect_to @album
        else
          flash[:alert] = "album has not been created."
          render action: "new"
        end
      end
      format.js do
        render text: @album.errors.full_messages.join,
          status: :unprocessable_entity unless @album.save
      end
    end
  end

  private

    def album_params
      params.require(:album).permit(:name)
    end

end
