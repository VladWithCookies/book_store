class RatingsController < ApplicationController

  def create
    @book = Book.find_by(id: rating_params[:book_id])
    @rating = Rating.new(rating_params)   
    if @rating.save
      redirect_to @book 
    else
      redirect_to add_rating_book_path(@book)
    end
  end

  private
    def rating_params
      params.require(:rating).permit(:text, :title, :rating, :user_id, :book_id)
    end
end
