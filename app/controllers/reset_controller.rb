class ResetController < ApplicationController
  def reset
    Post.destroy_all
    User.destroy_all
    20.times do
      FactoryGirl.create(:user)
    end

    User.last.update(is_admin: true)

    30.times do
      FactoryGirl.create(:post)
    end
    session[:user_id] = nil
    redirect_to root_path
  end
end