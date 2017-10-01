class PostsController < ApplicationController
  def index
    # @posts = Post.all.includes(:user)
    sql = "SELECT `posts`.* FROM `posts`"
    sql +=  "WHERE user_id = #{params[:user_id]}" if params[:user_id] && params[:user_id] != 'all'

    flash.now[:mes] = sql
    raw_posts = Post.connection.execute(sql)
    @posts = []
    raw_posts.each do |raw_post|
      @posts << Post.new(id: raw_post[0], title: raw_post[1], description: raw_post[2], content: raw_post[3], user_id: raw_post[4], created_at: raw_post[5], updated_at: raw_post[6])
    end
    @users = User.all
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to posts_path, notice: 'Post was deleted successfully'
  end

  def show
    sql = "SELECT `posts`.* FROM `posts` WHERE id = #{params[:id]}"
    flash.now[:mes] = sql
    raw_post = Post.connection.execute(sql).first
    @post = Post.new(id: raw_post[0], title: raw_post[1], description: raw_post[2], content: raw_post[3], user_id: raw_post[4], created_at: raw_post[5], updated_at: raw_post[6])
  end
end
