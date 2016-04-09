module RegistrationsHelper
  def normalize_note_for(request)
    if (request.interested_in_rental == true)  && (request.interested_in_purchase == true)
      "#{request.name} is interested in both renting and purchasing this piece."
    elsif (request.interested_in_rental == true) && (request.interested_in_purchase == false)
      "#{request.name} is interested in renting this piece."
    elsif (request.interested_in_rental == false) && (request.interested_in_purchase == true)
      "#{request.name} is interested in purchasing this piece."
    else
      "#{request.name} did not indicate a preference for either rental or purchase."
    end
  end
end
