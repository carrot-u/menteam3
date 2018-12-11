class UserTagsController < ApplicationController
  before_action :user, only: [:index, :new, :create]

  def index

    @user_tags = UserTag.where(user_id: @user.id)
    
  end

  def new
    @user_tags = UserTag.new
  end


  def create
    # @user_tags = UserTag.create(params[@user.id, :topic_id])
    @user_tags  = UserTag.new
    @user_tags.topic_id = params[:user_tag][:topic_id]
    @user_tags.user_id = @user.id
    @user_tags.save
    redirect_to user_tags_path
  end



private

  def user
    @user = User.find(session[:user_id])
  end



end
