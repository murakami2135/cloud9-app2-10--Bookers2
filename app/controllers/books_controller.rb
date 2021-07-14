class BooksController < ApplicationController
  before_action :authenticate_user!

  def edit
    @book=Book.find(params[:id])
    @user=@book.user
    if @user == current_user
    else
      redirect_to books_path
    end
  end

  def create
    @user = current_user
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
     redirect_to book_path(@book)
    else
      @books= Book.all
     render :index
    end
  end

  def index
    @bookers =Book.new
    @books= Book.all
    @book = Book.new
    @user = current_user
  end

  def show
    @bookers =Book.new
    @book =Book.find(params[:id])
    @user = @book.user
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to @book
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
     redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :caption)
  end
end
