require 'rails_helper'

RSpec.describe User, type: :model do
    it "return if User valid" do
      expect(User.create(email: "asd@test.com", password: "111123")).to be_valid
    end
end
