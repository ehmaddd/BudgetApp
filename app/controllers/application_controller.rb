class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: "You are not authorized to access this page."
  end

  def after_sign_in_path_for(_resource)
    groups_path
  end

  def after_sign_out_path_for(_resource)
    path = splash_index_path
    puts "Redirecting to: #{path}"
    path
  end
end
