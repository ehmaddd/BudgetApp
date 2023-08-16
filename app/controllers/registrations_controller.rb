class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    authenticated_root_path
  end

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  # ...
end
