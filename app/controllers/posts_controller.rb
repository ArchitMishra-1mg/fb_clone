class PostsController < ApplicationController
  before_action :logged_in_user, only: %i[create destroy]

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = 'Post created!'
      @post.pictures.create(url: params[:post][:picture])
      redirect_to root_url
    else
      flash[:danger] = "Content can't be empty"
      redirect_back fallback_location: root_path
    end
  end

  def destroy; end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
