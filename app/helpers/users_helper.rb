module UsersHelper
  def age(user)
    (Date.today.strftime('%Y%m%d').to_i - user.birthday.strftime('%Y%m%d').to_i) / 10000
  end

  def engineer_history(user)
    (Date.today.strftime('%Y%m%d').to_i - user.engineer_start_at.strftime('%Y%m%d').to_i) / 10000
  end
end
