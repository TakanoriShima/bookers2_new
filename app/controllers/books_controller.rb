class BooksController < ApplicationController
  def index
    @books = Book.all
    @user = current_user
    @new_book = Book.new
    @errors = flash[:errors] || []
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    
    if @book.save
      redirect_to @book, notice: 'You have created book successfully.'
    else
      redirect_to books_path, flash: { errors: @book.errors.full_messages }
    end
  end
  
  def show
    @book = Book.find(params[:id])
    @new_book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user != current_user
      redirect_to books_path
    end  
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.user != current_user
      redirect_to books_path
    end 
    if @book.update(book_params)
      redirect_to @book, notice: 'You have updated book successfully.'
    else
      render :edit
    end
  end  
  
    
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end
 
  private 
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
