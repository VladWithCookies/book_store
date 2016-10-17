class BooksController < ApplicationController
  before_filter :get_books, only: [:show, :add_rating]

  def index
    @books = Book.page(params[:page]).per(6)
    @categories = Category.all
  end

  def show   
    @ratings = Rating.ratings_for_book(params[:id]).decorate
    @order_item = OrderItem.new
  end

  private 
    def get_books
      @book = Book.find_by(id: params[:id])
    end

end
