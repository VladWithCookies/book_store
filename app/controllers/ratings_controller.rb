class RatingsController < ApplicationController

  def create
    @book = Book.find_by(id: rating_params[:book_id])
    @rating = Rating.new(rating_params)   
    redirect_to @book if @rating.save
  end

  private
    def rating_params
      params.require(:rating).permit(:text, :title, :rating, :user_id, :book_id)
    end
end
