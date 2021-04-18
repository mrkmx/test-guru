class Users::SessionsController < Devise::SessionsController
  def create
    super
    flash[:notice] = "Вы вошли как #{set_welcome_name current_user}"
  end

  private
  
  def set_welcome_name(current_user)
    if current_user.first_name.empty? && current_user.last_name.empty?
      return current_user.email
    else
      return "#{current_user.first_name} #{current_user.last_name}"
    end
  end
end
