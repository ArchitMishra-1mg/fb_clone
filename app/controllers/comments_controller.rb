class CommentsController < ApplicationController
  def index
    @comments = Comment.where(post_id: params[:post_id])
  end

  def create
    @post = Post.find(params[:post_id])
    @post.comments.create(user: current_user, content: params[:comment][:content])
    @post.update(nComments: @post.nComments + 1)
    flash[:success] = 'Done Successfully'
    redirect_to(post_comments_path(post_id: @post.id))        # or the location user was before commenting
  end

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end
end
