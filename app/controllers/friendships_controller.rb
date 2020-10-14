class FriendshipsController < ApplicationController
  def new
    @friendship = Friendship.new
  end

  def create
    @friendship = Friendship.new(friendship_params)
    if new_request? && @friendship.valid? && @friendship.save
      redirect_to users_path
    elsif !new_request?
      redirect_to users_path, alert: 'You have already sent a request'
    else
      render 'users/index'
    end
  end

  def show; end

  def update
    @friendship = Friendship.find(params[:id])
    redirect_to users_path if @friendship.confirmed == false && @friendship.confirm_friend
  end

  def destroy
    @friendship = Friendship.where(user_id: [params[:id], current_user.id], friend_id: [current_user.id, params[:id]])

    if !@friendship.nil? && @friendship.each(&:destroy)
      redirect_to users_path
    else
      render 'users/index'
    end
  end

  private

  def new_request?
    !current_user.request_exists?(User.find_by(id: params[:friendship][:friend_id]))
  end

  def friendship_params
    params.require(:friendship).permit(:user_id, :friend_id, :confirmed)
  end
end
