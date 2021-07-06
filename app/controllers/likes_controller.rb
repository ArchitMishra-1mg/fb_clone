class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @user = current_user
    if Like.where(post_id: @post.id, user_id: @user.id).count.positive?
      flash.now[:danger] = 'Already Liked'
    else
      @user.likes.create(post_id: @post.id)
      n_likes = @post.nLikes + 1
      @post.update(nLikes: n_likes)
      redirect_back(fallback_location: root_path)
    end
    # debugger
  end

  def show
    # @post = Post.find(params[:post_id])
  end

  def index
    @post = Post.find(params[:post_id])
    @likes = Like.where(posts: @post)
  end
end
