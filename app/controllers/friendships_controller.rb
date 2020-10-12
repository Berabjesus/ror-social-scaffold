class FriendshipsController < ApplicationController
  def new
    @friendship = Friendship.new
  end

  def create
    @friendship = Friendship.new(friendship_params)
    if @friendship.valid? && @friendship.save
      redirect_to users_path
    else
      render 'users#show'
    end
  end

  private

  def friendship_params
    params.require(:friendship).permit(:user, :friend_id, :confirmed)
  end
end
