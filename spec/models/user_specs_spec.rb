require 'rails_helper'

RSpec.describe User, type: :model do

  describe "Validations" do

    before do
      @user = User.new(
        email: "test@123.com", 
        first_name: "first",
        last_name: "last", 
        password: "test", 
        password_confirmation: "test"
      )
      @user.save
    end
    it "is a valid user" do
      expect(@user.valid?).to be true
    end

    it "validates password and password confirmation match" do
      @user.password_confirmation = "tet"

      expect(@user.valid?).to be false
    end
    it "validates only unique emails can be used for creation" do
       
      @user2 = User.new(
        email: "test@123.com",
        first_name: "first",
        last_name: "last",
        password: "test",
        password_confirmation: "test"
      )
      @user2.save

      expect(@user2.valid?).to be false
    end

    it "validates password has a minimum length" do

    end
  end
end
