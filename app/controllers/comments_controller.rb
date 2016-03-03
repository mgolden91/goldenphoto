class CommentsController < ApplicationController

  def new
    @image = Image.find(params[:image_id])
    @comment = Comment.new
  end

  def create
    @image = Image.find(params[:image_id])
    @comment = Comment.new(comment_params)
    @comment.image_id = @image.id
    @comment.user_id = current_user.id



    if @comment.save
      flash[:notice] = "Comment Saved"
    else
      flash[:alert] = "Error adding comment. Try again."
    end
    redirect_to image_path(@image)
  end

  def destroy
    @comment = Comment.find(params[:id])

    if @comment.destroy
      flash[:notice] = "Comment was deleted"
      redirect_to images_path
    else
      flash.now[:alert] = "Error deleting comment. Try again."
      redirect_to images_path
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :user_id, :image_id)
  end

end
