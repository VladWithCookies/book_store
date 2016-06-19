class BooksController < ApplicationController
  def index
    @books = Book.all
    @categories = Category.all
  end

  def show
    @book = Book.find(params[:id])
    @ratings = Rating.where(book_id: params[:id])
  end

  def add_rating 
    @book = Book.find(params[:id])
    @rating = Rating.new
  end

  def home

  end
end
