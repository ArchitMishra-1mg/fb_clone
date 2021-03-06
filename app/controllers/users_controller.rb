class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index]

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def index
    @all_users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # debugger
      # @user.picture.create(url: params[:user][:picture])
      Picture.create(url: params[:user][:picture], imageable_type: 'User', imageable_id: @user.id)
      log_in @user
      flash[:success] = 'Welcome to the Bababook!'
      redirect_to @user
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name,
                                 :email,
                                 :password,
                                 :password_confirmation,
                                 :mob_no,
                                 :city,
                                 :dob)
  end
end
