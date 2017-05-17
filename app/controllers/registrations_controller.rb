class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:usuario).permit(:first_name, :last_name, :email, :telefono, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:usuario).permit(:first_name, :last_name, :email, :telefono, :password, :password_confirmation, :current_password)
  end
end