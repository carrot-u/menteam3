class PairingsController < ApplicationController
    before_action :user

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
        @user = User.find(params[:id])

        @request = []
        @user.mentor_pairings.each do |pairing|
          if pairing.status == 'pending'
            @request << pairing
          end
        end
        @request
        byebug
    end

    def edit
        @pairing = Pairing.find(params[:id])
        @pairing.status = params[:status]
        if @pairing.save
            redirect_to pairing_path(@user.id), alert: "You've successfully accepted request!"
        else
            redirect_to pairing_path(@user.id), alert: "Oops, Something went wrong! Please try again"
        end
    end


    private
    def pairing_params
        params.require(:pairing).permit(:mentor_id, :mentee_id)
    end

    def user
        @user = User.find(params[:id])
    end

end
