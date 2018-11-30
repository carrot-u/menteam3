class PairingsController < ApplicationController
    before_action :user, only: [:edit, :show]

        # @mentor_of_user =  @user.mentee_pairings
        # @mentee_of_user = @user.mentor_pairings

    def index
        @mentors = []
        @user.mentee_pairings.each do |mentor|
            @mentors << User.find(mentor.mentor_id)

        end
        @mentors

        @mentees = []
        @user.mentor_pairings.each do |mentee|
            @mentees << User.find(mentee.mentee_id)

        end
        @mentees

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
        @pairing = Pairing.find(params[:id])
        @pairing.status = params[:status]
        if @pairing.save
            redirect_to pairing_path(@user.id), flash: {alert: "You've sucessfully accepted the request!"}
        else
            redirect_to pairing_path(@user.id), flash: {notice: "Error!"}
        end
    end

    def create
      @pairing = Pairing.new(pairing_params.merge(status: 'pending', mentee_id: current_user.id ))
      @pairing.save
      redirect_to pairing_path(current_user.id) #if request page shows your sent pending/received pending requests
    end


    private
    def pairing_params
        params.require(:pairing).permit(:mentor_id)
    end

    def user
        @user = User.find(session[:user_id])
    end

end
