# pieces helper module
module PiecesHelper
  def availability_status(piece)
    if piece.available && !piece.sold
      'Available for both rental and purchase.'
    elsif !piece.available && !piece.sold
      'Unavailable at the moment'
    else
      'Sold'
    end
  end
end
