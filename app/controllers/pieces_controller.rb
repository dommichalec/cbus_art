# pieces controller
class PiecesController < ApplicationController
  def index
    @pieces = Piece.order_by_last_updated
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
    if @piece.save
      redirect_to piece_path(@piece.id)
    else
      render :edit
    end
  end

  def new
    @piece = Piece.new
  end

  def create
    @piece = Piece.create(piece_params)
    if @piece.save
      redirect_to piece_path(@piece.id)
    else render :new
    end
  end

  def destroy
    @piece = Piece.find(params[:id])
    @piece.destroy
    redirect_to pieces_url
  end

  private

  def piece_params
    params.require(:piece).permit(:title, :description, :medium, :size, :rental_price_per_day, :rental_price_per_week, :rental_price_per_month, :sale_price, :available, :sold)
  end
end
