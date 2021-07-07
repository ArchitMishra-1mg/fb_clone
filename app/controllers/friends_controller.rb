class FriendsController < ApplicationController
  def show_friends
    @user = User.find(params[:id])
    @friends = all_friends(@user.id)
  end

  def create
    friendship = Friend.new(user_id: params[:id], friend_id: current_user.id)
    friendship.save
    flash[:success] = 'Friend Request Sent'
    redirect_back fallback_location: root_path
  end

  def destroy
    @user1 = User.find(params[:id])       # one on whose page logged in user is...
    @user2 = current_user
    friendship = friendship_accepted(@user2.id, @user1.id)
    friendship&.destroy
  end

  def pending
    @pending = pending_req(current_user.id)
  end

  def accept
    # debugger
    @user1 = User.find(params[:friend_id]) # one on whose page current_user is...
    @user2 = current_user
    friendship = friendship_pending(@user2.id, @user1.id)
    friendship&.update(status: :accepted)
    redirect_to @user1
  end

  def reject
    @user1 = User.find(params[:friend_id]) # one on whose page logged in user is...
    @user2 = current_user
    friendship = friendship_pending(@user2.id, @user1.id)
    friendship&.destroy
    redirect_back fallback_location: root_path
  end
end
