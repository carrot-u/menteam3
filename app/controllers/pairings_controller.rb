class PairingsController < ApplicationController
    before_action :user, only: [:index, :edit, :show, :create]

        # @mentor_of_user =  @user.mentee_pairings
        # @mentee_of_user = @user.mentor_pairings

    def index
        @list_of_mentor_pairings = @user.mentee_pairings.where(status: "active")
        
        @list_of_mentee_pairings = @user.mentor_pairings.where(status: "active")
    end

    def show
        @pending_mentor_request = @user.mentor_pairings.select do |pairing|
          pairing.status == 'pending'
        end
        @pending_mentee_request = @user.mentee_pairings.select do |pairing|
          pairing.status == 'pending'
        end
    end

    def edit
        @pairing = Pairing.find(params[:pairing_id])
        @pairing.status = params[:status]
        if @pairing.save
            redirect_to pairing_path(@user.id), flash: {alert: "You've sucessfully accepted the request!"}
        else
            redirect_to pairing_path(@user.id), flash: {notice: "Error!"}
        end
    end

    def create
      @pairing = Pairing.new(pairing_params.merge(status: 'pending', mentee_id: @user.id))
      @pairing.save
      redirect_to pairing_path(@user.id) #if request page shows your sent pending/received pending requests
    end


    private
    def pairing_params
        params.require(:pairing).permit(:mentor_id)
    end

    def user
        @user = User.find(session[:user_id])
    end

end
