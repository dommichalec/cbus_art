# pieces controller
class PiecesController < ApplicationController
  def index
    @pieces = Piece.all
  end

  def show
    @piece = Piece.find(params[:id])
  end

  def edit
    @piece = Piece.find(params[:id])
  end

  def update
    @piece = Piece.find(params[:id])
    @piece.update(piece_params)
    redirect_to piece_path
  end

  private

  def piece_params
    params.require(:piece).permit(:title, :description, :medium, :size, :rental_price_per_day, :rental_price_per_week, :rental_price_per_month, :sale_price, :available, :sold)
  end
end
