require 'rails_helper'

  describe MailWorker do
    let(:attributes) do
        {
            name: "Name",
            phone: "1234567891011123",
            title: "Lorem ipsum dolor sit amet, consectetuer adipiscin",
            description: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean m",
            email: "example@gmail.com",
          }
    end
    it "is considered valid" do
      expect(Letter.new(attributes)).to be_valid
    end
end

