class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from StandardError, with: :res
  before_action :current_user

  def current_user
    @current_user ||= User.find_by_id session[:user_id]
  end

  def res(exception)
    @exception = exception
    render 'shared/error', layout: false
    return
  end
end
