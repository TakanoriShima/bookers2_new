class BooksController < ApplicationController
  def index
  end

  # ここから追加
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    
    if @book.save
      redirect_to @book
    else
      redirect_to books_path
    end
  end  
  ## ここまで追加

  def show
  end

  def edit
  end
  
  # ここから追加
  private 
  def book_params
    params.require(:book).permit(:title, :body)
  end
  # ここまで追加
end
