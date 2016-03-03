class ImagesController < ApplicationController

  def index
    @images = Image.all.paginate(:page => params[:page], :per_page => 15)
  end

  def show
    @image = Image.find(params[:id])
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)

    if @image.save
      redirect_to @image, notice: "Image was created successfully."
    else
      flash.now[:alert] = "Error uploading image. Please try again."
      render :new
    end
  end

  def edit
    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])
    @image.assign_attributes(image_params)

    if @image.save
      falsh[:notice] = "Image was updated successfully."
    else
      flash.now[:alert] = "Error updating image. Please try again."
      render :edit
    end
  end

  def destroy
    @image = Image.find(params[:id])

    if @image.destroy
      flash[:notice] = "Image was deleted successfully"
      redirect_to action: :index
    else
      flash.now[:alert] = "There was an error deleting the image. Try again."
      render :show
    end
  end

  private

  def image_params
    params.require(:image).permit(:title, :body, :picture, :thumb)
  end
end
