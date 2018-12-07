class user_tagTagsController < ApplicationController
  def edit
    @topic_selection = []
    @topic_selection.each do |topic|
      topic.push(:topic_id)
    end

    @user_tag_tag = UserTag.create(params session[:user_tag_id], :topic_id)

    @user_tag_tag.each do |user_tag_topics|
      user_tag_topics.create(params session[:user_tag_id], @topic_selection)
    end
  end

  def create
    @user_tag = UserTag.new(user_tag_params)

    # respond_to do |format|
    if @user_tag.save
      puts "user_tag_saved"
      #format.html {redirect_to user_tag_path(@user_tag), notice: 'Your account has been created!'}
      redirect_to @user_tag
    else
      render 'new'
    end
  end
end
