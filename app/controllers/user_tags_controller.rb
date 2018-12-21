class UserTagsController < ApplicationController
  before_action :user, only: [:new, :create]

  def new
    @user_tags = UserTag.new

    @user_tags_list = UserTag.where(user_id: @user.id)
  end


  def create
    topic_ids = params[:user_tag][:topic_id].select {|tag| tag.present? }
    topic_ids.each do |topic_id|
      @user_tags  = UserTag.new
      @user_tags.topic_id = topic_id
      @user_tags.user_id = @user.id
      @user_tags.save
    end

    # @user_tags = UserTag.create(params[@user.id, :topic_id])

    redirect_to users_path
  end



private

  def user
    @user = User.find(session[:user_id])
  end



end
