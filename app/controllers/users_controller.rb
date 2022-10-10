class UsersController < ApplicationController
  def index
  end

  def show
    # ここから追記 
    @user = User.find(params[:id])
    @books = @user.books
    @new_book = Book.new
    # ここまで追記
  end

  def edit
  end
end
