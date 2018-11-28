class TopicsController < ApplicationController
  def index
  @topics = Topic.search(params[:term])
end

  def show
   @topic = Topic.find(params[:id])
   @user_tags = UserTag.where(topic_id: @topic.id).pluck(:user_id)
   @mentors = User.find(@user_tags)
   # render text: @topic.topic


  end
end
