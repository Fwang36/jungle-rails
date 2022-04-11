require 'rails_helper'

RSpec.describe User, type: :model do

  describe "Validations" do

    before do
      @user = User.new(
        email: "test@123.com", 
        name: "test_user", 
        password: "test", 
        password_confirmation: "test"
      )
    end
    it "is a valid user" do
      expect(@user.valid?).to be true
    end

    it "validates password and password confirmation match" do
      @user.password_confirmation = "tet"

      expect(@user.valid?).to be false
    end

  end
end
