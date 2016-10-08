class RatingsController < ApplicationController
  load_and_authorize_resource
  
  def create
    @book = Book.find_by(id: rating_params[:book_id])
    @rating = Rating.new(rating_params)   
    if @rating.save
      redirect_to @book, notice: t('notices.rating_create')
    else
      redirect_to new_book_rating_path(@book), danger: "Invalid review!"
    end
  end

  def new
    @book = Book.find_by(id: params[:book_id])
    @rating = Rating.new
  end

  private
    def rating_params
      params.require(:rating).permit(:text, :title, :rating, :user_id, :book_id)
    end
end
