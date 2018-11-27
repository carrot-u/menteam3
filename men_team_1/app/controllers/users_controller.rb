class UsersController < ApplicationController
  
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    respond_to do |format|
      if @user.save
        format.html {redirect_to user_path(@user), notice: 'Your account has been created!'}
      else 
        format.html {render :new}
      end
    end
  end

  def show
    @user = User.find(params[:id])

    @request = []
    @user.mentor_pairings.each do |pairing|
      if pairing.status == 'pending'
        @request << User.find(pairing.mentee_id)
      end
    end
    @request
   
  end

  private
  
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :position)
  end
end
