class BooksController < ApplicationController
  load_and_authorize_resource only: [:add_rating]
  
  def index
    @books = Book.page(params[:page]).per(12)
    @categories = Category.all
  end

  def show
    @book = Book.find_by(id: params[:id])
    @ratings = Rating.where(book_id: params[:id], approval: true)
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
