class UsersController < ApplicationController
  def index
    redirect_to user_path(:id => session[:user_id]) if session[:user_id]
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
   if @user.update(user_params)
     flash[:notice] = "Your profile was updated"
     redirect_to user_path(@user)
   else
     render 'edit'
   end
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

    redirect_to @user if session[:user_id] != params[:id].to_i

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
