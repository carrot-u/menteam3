class PairingsController < ApplicationController
    before_action :user

        # @mentor_of_user =  @user.mentee_pairings
        # @mentee_of_user = @user.mentor_pairings
 
    def index
        @mentors = []
        @user.mentee_pairings.each do |mentor| 
            @mentors << User.find(mentor.id) 
            
        end
        @mentors

        @mentees = []
        @user.mentor_pairings.each do |mentee| 
            @mentees << User.find(mentee.id) 
            
        end
        @mentees
    end


    private
    def pairing_params
        params.require(:pairing).permit(:mentor_id, :mentee_id)
    end

    def user
        @user = User.find(params[:id])
    end

end
