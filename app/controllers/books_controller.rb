class BooksController < ApplicationController
  def index
    @books = Book.page(params[:page]).per(12  )
    @categories = Category.all
  end

  def show
    @book = Book.find(params[:id])
    @ratings = Rating.where(book_id: params[:id])
    @order_item = OrderItem.new
  end

  def add_rating 
    @book = Book.find(params[:id])
    @rating = Rating.new
  end

  def home
    @items = Book.most_popular(5)
    @order_item = OrderItem.new
  end
end
