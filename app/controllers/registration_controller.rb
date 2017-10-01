class RegistrationController < ApplicationController
  def show_login
    redirect_to(root_path, notice: 'You are already logged in') if current_user
  end

  def login
    user = User.where("email = '#{params[:email]}' AND password = '#{params[:password]}'").first
    flash[:mes] = User.where("email = '#{params[:email]}' AND password = '#{params[:password]}'").to_sql
    if user
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Logged in successfully'
    else
      redirect_to show_login_path, alert: 'Incorrect email or password'
    end
  end

  def show_safe_login
    redirect_to(root_path, notice: 'You are already logged in') if current_user
  end

  def safe_login
    user = User.where(email: params[:email], password: params[:password]).first
    flash[:mes] = User.where(email: params[:email], password: params[:password]).to_sql
    if user
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Logged in successfully'
    else
      redirect_to show_safe_login_path, alert: 'Incorrect email or password'
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path, notice: 'You are logged out'
  end
end