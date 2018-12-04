class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    # respond_to do |format|
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      #format.html {redirect_to user_path(@user), notice: 'Your account has been created!'}
      redirect_to @user
    else
      render 'new'
      #format.html {render :new}
    end
    #end
  end

  def show
    @user = User.find(session[:user_id])

    @pending_mentor_request = []
    @user.mentor_pairings.each do |pairing|
      if pairing.status == 'pending'
        @pending_mentor_request << User.find(pairing.mentee_id)
      end
    end
    @pending_mentor_request

  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :position, :password)
  end
end
