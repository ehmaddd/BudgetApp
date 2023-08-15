class RegistrationsController < Devise::RegistrationsController
  def after_sign_up_path_for(_resource)
    authenticated_root_path
  end
end
