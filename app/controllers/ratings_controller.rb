class RatingsController < ApplicationController
  def create
    @book = Book.find(project_params[:book_id])
    @rating = Rating.new(project_params)   
    redirect_to @book if @rating.save
  end

  private
    def project_params
      params.require(:rating).permit(:text, :title, :rating, :user_id, :book_id)
    end
end
