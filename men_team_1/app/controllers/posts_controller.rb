class PostsController < ApplicationController
    
    def index
      @posts = Post.all
    end
  
    def new
        @post = Post.new
    end
  
    def show
    end
  
    def create
      @post = Post.new(post_params)
  
      respond_to do |format|
        if @post.save
          format.html { redirect_to @post, notice: 'Post was successfully created.' }
          format.json { render :show, status: :created, location: @post }
        else
          format.html { render :new }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    end

    def user 
        @user = User.find(session[:user_id])
    end
  
    private
    def set_post
        @post = Post.find(params[:id])
    end

    def post_params
        params.require(:post).permit(:title, :body)
    end


end
       
