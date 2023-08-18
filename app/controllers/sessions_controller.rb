class SessionsController < Devise::SessionsController
  before_action :redirect_if_signed_in, only: [:new]
  prepend_before_action :require_no_authentication, only: %i[new create]
  prepend_before_action :allow_params_authentication!, only: :create
  prepend_before_action :verify_signed_out_user, only: :destroy
  prepend_before_action(only: %i[create destroy]) do
    request.env['devise.skip_timeout'] = true
  end
  def after_sign_in_path_for(_resource)
    groups_path # Redirect to groups#index after sign in
  end

  def new
    if user_signed_in?
      flash[:notice] = 'You are already logged in.'
      redirect_to root_path
    else
      self.resource = resource_class.new(sign_in_params)
    end
  end

  def destroy
    sign_out current_user
    redirect_to unauthenticated_root_url
  end

  private

  def redirect_if_signed_in
    redirect_to root_path if user_signed_in?
  end
end
