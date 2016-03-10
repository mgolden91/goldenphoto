class CategoriesController < ApplicationController
  def new
    @category = Category.new
    authorize @category
  end

  def index
    @category = Category.all
    authorize @category
  end

  def show
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(category_params)
    authorize @category

    if @category.save
      flash[:notice] = "Category Saved"
    else
      flash[:alert] = "Error adding category. Try again."
    end
    redirect_to categories_path
  end

  def destroy
    @category = Category.find(params[:id])
    authorize @category

    if @category.destroy
      flash[:notice] = "Category was deleted"
      redirect_to categories_path
    else
      flash.now[:alert] = "Error deleting category. Try again."
      redirect_to categories_path
    end
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end

end
