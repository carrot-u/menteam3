class CommentsController < ApplicationController
    before_action :user
    before_action :set_post 
    #test
    

    def create 
        @comment = Comment.new(comment_params)
        @comment.user_id = @user.id     
        @comment.post_id = params[:post_id]
        if @comment.save
            flash[:notice] = "Your comment was posted!"
            redirect_to post_path(@post)
        else
            redirect_to post_path(@post)
        end 
    end

    def edit
        @comment = Comment.find(params[:id])
    end

    def update
        @comment = Comment.find(params[:id])
        @comment.update(comment_params)
        redirect_to @post
    end

    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        redirect_to @post
    end

    private
    def comment_params
        params.require(:comment).permit(:user_id, :post_id, :comment)
    end

    def set_post
        @post = Post.find(params[:post_id])
    end

    def user
        @user = User.find(session[:user_id])
    end
end
