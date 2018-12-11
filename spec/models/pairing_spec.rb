require 'rails_helper'

RSpec.describe Pairing, type: :model do





  xdescribe '.create!' do
    let(:attributes) do
      {

      }
    end
    subject do
      Pairing.create!(attributes)
    end 
    it {       
      is_expected.to raise_error(ActiveRecord::RecordInvalid)
    }
    
  end

  describe '.create' do

    subject do
      described_class.create(attributes)
    end 

    context "when all attributes are set" do

      let!(:mentor) {
        User.create!( 
          first_name: 'Jon', 
          last_name: 'Smith', 
          password:'123456', 
          position: '111',
          email: 'jon@smith.com'
        )
      }

      let!(:mentee) {
        User.create!( 
          first_name: 'Jon', 
          last_name: 'Doe', 
          password:'123456', 
          position: '111',
          email: 'jon@doe.com'
        )
      }

      let(:attributes) {
        {
          mentee_id: mentor.id,
          mentor_id: mentee.id,
          status: "pending"
        }
      }
      it "should persist" do
        expect(subject.persisted?).to eq(true)
      end
    end


    context "when some attribtues are missing" do
      let(:attributes) { {} }
    
      it "should not persist" do
        expect(subject.persisted?).to eq(false)
      end

    end
  end
end

