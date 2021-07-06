class StaticController < ApplicationController
  def home
    if logged_in?
      @user = current_user
      @posts = @user.posts
      @post = Post.new(user_id: @user.id)
    end
  end
end
