class PostsController < ApplicationController
  before_action :logged_in_user, only: %i[create destroy]

  def create
    # debugger
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = 'Post created!'
      redirect_to root_url
    else
      render 'static/home'
    end
  end

  def destroy; end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
