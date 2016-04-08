class RegistrationsController < ApplicationController
  before_action :set_piece

  def index
    @registrations = @piece.registrations
  end

  def new
    @registration = @piece.registrations.new
  end

  def create
    @registration = @piece.registrations.new(registration_params)
    if @registration.save
      flash[:notice] = "Your registration for #{@piece.title} has been sent!"
      redirect_to piece_path(@piece.id)
    else
      render :new
    end
  end

  private

  def registration_params
    params.require(:registration).permit(:name, :email, :area_code, :phone_number, :message, :interested_in_rental, :interested_in_purchase, :neighborhood)
  end

  def set_piece
    @piece = Piece.find(params[:event_id])
  end
end
