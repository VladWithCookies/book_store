class BooksController < ApplicationController
  def index
    @books = Book.page(params[:page]).per(12)
    @categories = Category.all
  end

  def show
    @book = Book.find_by(id: params[:id])
    @ratings = Rating.book_ratings(params[:id])
    @order_item = OrderItem.new
  end

  def add_rating 
    @book = Book.find_by(id: params[:id])
    @rating = Rating.new
  end

  def home
    @items = Book.most_popular(3)
    @order_item = OrderItem.new
  end

end
