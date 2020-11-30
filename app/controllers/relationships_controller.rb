class RelationshipsController < ApplicationController
  def create
    follow = current_user.active_relationships.build(follower_id: params[:user_id])
    follow.save
    redirect_back fallback_location: @user
  end

  def destroy
  end
end
