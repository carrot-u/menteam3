class PostsController < ApplicationController
  before_action :user, only: [:index, :new, :create, :edit, :show, :destroy, :update]
  before_action :pairing, only: [:new, :create, :edit]
  before_action :set_post, only: [:edit, :show, :destroy, :update]
    
    def index 
      pairings = @user.all_pairings
      @post = []
      pairings.each do |pairing|
        pairing.posts.each do |post|
          @post << post
        end
      end
      @post
    end

  
    def new 
      @post = Post.new
    end


    def create
      @post = Post.new(post_params) 
      @post.user_id = @user.id
      @post.pairing_id = @pairing.id
      if @post.save
        flash[:notice] = "Your question was posted!"
        redirect_to post_path(@post)
      else
        render 'new'
      end
    end


    def update
      if @post.update(post_params)
        flash[:notice] = "Your question was updated"
        redirect_to post_path(@post)
      else
        render 'edit'
      end
    end

    def show 
      @comments = @post.comments
    end

    def edit
      
    end

    def destroy
      @post.destroy
      flash[:notice] = "Your question has been removed"
      redirect_to posts_path
    end

    private

      def set_post
        @post = Post.find(params[:id])
      end

      def post_params
        params.require(:post).permit(:subject, :body)
      end

      def user
        @user = User.find(session[:user_id])
      end

      def pairing
        @pairing = Pairing.find(params[:pairing_id])
      end

end