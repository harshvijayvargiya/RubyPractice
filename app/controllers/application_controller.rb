class ApplicationController < ActionController::Base
include Devise::Controllers::Rememberable
    before_action :authenticate_user!

  def after_sign_in_remember_me(resource)
    remember_me resource
  end 

  rescue_from CanCan::AccessDenied do |exception|
  # flash[:error] = "Access denied."
  # redirect_to root_path
  redirect_to root_path, notice: 'Access denied.'
end
end
