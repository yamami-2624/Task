class BooksController < ApplicationController
  def top
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def new
  	@book = Blog.new
  end

  def create
    book = Book.new(book_params)
    if book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(book)
    else
      redirect_to book_path
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end


  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      flash[:notice] =  "Book was successfully updated."
      redirect_to book_path(blog)
    else
    redirect_to book_path
    end
  end

  def destroy
    book = Blog.find(params[:id])
    book.destroy
    flash[:notice] = "Book was successfully destroyed."
    redirect_to book_path
  end



  private

  def book_params
    params.permit(:title, :body)
  end
end
