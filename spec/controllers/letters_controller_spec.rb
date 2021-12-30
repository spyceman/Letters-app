require "rails_helper"

RSpec.describe "Letters", type: :request do

    describe "POST letters#create" do
        let(:attributes) do
            {
                name: "Name",
                phone: "1234567891011123",
                title: "Lorem ipsum dolor sit amet, consectetuer adipiscin",
                description: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean m",
                email: "example@gmail.com",
              }
          end
        it 'create letter with valid attributes' do
            letter = Letter.new(attributes)
            post '/letters', :params => letter    
            json = JSON.parse(response.body)    
            expect(json).to eq(letter)
        end
      end
  end