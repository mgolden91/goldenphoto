class UsersController < ApplicationController

  def index
    @users = User.all
    authorize @users
  end

  def new
    @user = User.new
    authorize @user
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def edit
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    @user.assign_attributes(update_params)
    authorize @user

    if @user.save!
      flash[:notice] = "User was updated."
      redirect_to users_path
    else
      flash.now[:alert] = "Error saving user. Please try again."
      render :edit
    end
  end

  def create
    @user = User.new(user_params)
    authorize @user

    if @user.save
      flash[:notice] = "#{@user.username} created successfully"
      redirect_to users_path
    else
      flash[:alert] = "Error creating user. Try again."
      redirect_to users_path
    end
  end

  def destroy
    @user = User.find(params[:id])
    authorize @user

    if @user.destroy
      flash[:notice] = "#{@user.username} deleted successfully."
      redirect_to users_path
    else
      flash[:alert] = "Error deleting user. Try again."
      redirect_to :show
    end
  end


  private

  def user_params
      params.require(:user).permit(:email, :role, :username, :password, :password_confirmation)
  end

  def update_params
    params.require(:user).permit(:email, :username, :role)
  end

end
