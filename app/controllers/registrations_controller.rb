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
      flash[:notice] = "Your registration for #{@piece.title} has been sent to the artist!"
      redirect_to piece_path(@piece.id)
    else
      render :new
    end
  end

  def destroy
    @registration = @piece.registrations.find((params[:id]))
    name = @registration.name
    @registration.destroy
    redirect_to piece_registrations_url, notice: "#{name}'s request was successfully removed!"
  end

  private

  def registration_params
    params.require(:registration).permit(:name, :email, :phone_number, :message, :interested_in_rental, :interested_in_purchase, :neighborhood, :zip_code, :organization)
  end

  def set_piece
    @piece = Piece.find(params[:piece_id])
  end
end
