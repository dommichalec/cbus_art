# pieces helper module
module PiecesHelper
  def availability_status(piece)
    if piece.available && !piece.sold
      'This piece is available for both rental and purchase.'
    elsif !piece.available && !piece.sold
      'This piece is currently unavailable.'
    else
      'This piece has been sold.'
    end
  end
end
