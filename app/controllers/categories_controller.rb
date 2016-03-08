class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def index
    @category = Category.all
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:notice] = "Category Saved"
    else
      flash[:alert] = "Error adding category. Try again."
    end
    redirect_to categories_path
  end

  def destroy
    @category = Category.find(params[:id])

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
