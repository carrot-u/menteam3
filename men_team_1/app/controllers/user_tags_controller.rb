class UserTagsController < ApplicationController
  def show
    @user_tags = UserTag.where(topic_id: params[:topic_id])
  end
end
