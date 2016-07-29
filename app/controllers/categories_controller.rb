class CategoriesController < ApplicationController
  def category
    @category_title = params[:category]
    @books = Book.books_by_category(params[:category]).page(params[:page]).per(6)
    @categories = Category.all
    render 'books/index'
  end
end
