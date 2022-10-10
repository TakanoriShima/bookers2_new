class UsersController < ApplicationController
  def index
    @user = current_user
    @users = User.all
    @new_book = Book.new
  end

  def show
    # ここから追記 
    @user = User.find(params[:id])
    @books = @user.books
    @new_book = Book.new
    # ここまで追記
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to current_user
    end  
  end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = 'You have updated user successfully.'
      redirect_to @user
    else
      render :edit
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
