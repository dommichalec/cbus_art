class RegistrationsController < ApplicationController
  def index
    @piece = Piece.find(params[:piece_id])
    @registrations = @piece.registrations
  end
end
