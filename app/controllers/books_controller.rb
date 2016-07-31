class BooksController < ApplicationController
  load_and_authorize_resource only: [:add_rating]
  before_filter :get_books, only: [:show, :add_rating]

  def index
    @books = Book.page(params[:page]).per(6)
    @categories = Category.all
  end

  def show   
    @ratings = Rating.ratings_for_book(params[:id])
    @order_item = OrderItem.new
  end

  def add_rating 
    @rating = Rating.new
  end

  def home
    @items = OrderItem.most_popular(3)
    @order_item = OrderItem.new
  end

  private 
    def get_books
      @book = Book.find_by(id: params[:id])
    end

end
