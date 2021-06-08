class Users::SessionsController < Devise::SessionsController
  def create
    super
    flash[:success] = "Вы вошли как #{set_welcome_name(current_user)}"
  end

  private
  
  def set_welcome_name(current_user)
    if current_user.first_name && current_user.last_name
      return "#{current_user.first_name} #{current_user.last_name}"
    else
      return current_user.email
    end
  end
end
