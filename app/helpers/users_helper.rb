module UsersHelper
  def membership_created_on(user)
    "#{user.created_at.strftime("%B #{user.created_at.day.ordinalize}, %Y")}"
  end
end
