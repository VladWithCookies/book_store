class CategoriesController < ApplicationController
  def category
    @category_title = params[:category]
    @books = find_books_by_category(@category_title).page(params[:page]).per(12)
    @categories = Category.all
    render 'books/index'
  end

  private 
    def find_books_by_category(category_title)
      Book.includes(:categories).where("categories.title" => category_title)              
    end
end
