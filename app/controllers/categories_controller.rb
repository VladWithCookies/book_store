class CategoriesController < ApplicationController
  def category
    @category_title = params[:category]
    @books = Book.includes(:categories).where("categories.title" => @category_title)
    @categories = Category.all
    render 'books/index'
  end
end
