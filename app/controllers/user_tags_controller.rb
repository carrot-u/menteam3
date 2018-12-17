class UserTagsController < ApplicationController
  before_action :user, only: [:new, :create]

  def new
    @user_tags = UserTag.new

    @user_tags_list = UserTag.where(user_id: @user.id)
  end


  def create
    @user_tags  = UserTag.new
    @user_tags.topic_id = params[:user_tag][:topic_id]
    @user_tags.user_id = @user.id
    @user_tags.save
    redirect_to new_user_tag_path
  end



private

  def user
    @user = User.find(session[:user_id])
  end



end
