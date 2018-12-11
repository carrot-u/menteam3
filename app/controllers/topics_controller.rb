class TopicsController < ApplicationController
  def index
    @topics = Topic.search(params[:term])
  end

  def show
    @topic = Topic.find(params[:id])
    @pairing = Pairing.new
    @user_tags = UserTag.where(topic_id: @topic.id).pluck(:user_id)
    @mentors = User.find(@user_tags)
    
  end

end
