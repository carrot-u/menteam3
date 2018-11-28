class TopicsController < ApplicationController
  def index
  @topics = Topic.search(params[:term])
end
end
