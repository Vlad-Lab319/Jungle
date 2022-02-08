require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  
  describe 'Validations' do
    # validation examples here
    before(:each) do
      @test_user = User.new(
        name:                  "Test",
        last_name:             "User",
        email:                 "test@test.com",
        password:              "password",
        password_confirmation: "password"
        )
        @test_user.save
    end
      
      it "valid with all attributes valid " do
        @test_user.save
        expect(@test_user).to be_valid
      end
      
      it "invalid when missing first name" do
        @test_user.name = nil
        expect(@test_user).to be_invalid
        expect(@test_user.errors.full_messages).to include("Name can't be blank")
      end
      
      it "invalid when missing last name" do
        @test_user.last_name = nil
        expect(@test_user).to be_invalid
        expect(@test_user.errors.full_messages).to include("Last name can't be blank")
      end
      
      it "invalid when missing email" do
        @test_user.email = nil
        expect(@test_user).to be_invalid
        expect(@test_user.errors.full_messages).to include("Email can't be blank")
      end
      
      it "invalid when missing password" do
        @test_user.password = nil
        expect(@test_user).to be_invalid
        expect(@test_user.errors.full_messages).to include("Password can't be blank")
      end
      
      it "invalid when missing password confirmation" do
        @test_user.password_confirmation = nil
        expect(@test_user).to be_invalid
        expect(@test_user.errors.full_messages).to include("Password confirmation can't be blank")
      end
      
      it "invalid when password confrimation mismatch password" do
        @test_user.password = "otherword"
        expect(@test_user).to be_invalid
        # puts @test_user.errors.full_messages()
        expect(@test_user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      
      it "invalid when password is too short" do
        @test_user.password = "pass"
        expect(@test_user).to be_invalid
        expect(@test_user.errors.full_messages).to include("Password is too short (minimum is 8 characters)")
      end
      
      it "invalid when email exists" do
        @new_user = User.create(
          name:                  "Test2",
          last_name:             "User2",
          email:                 "test@test.com",
          password:              "password",
          password_confirmation: "password"
          )
          expect(@new_user).to be_invalid
          # puts @new_user.errors.full_messages()
          expect(@new_user.errors.full_messages).to include("Email has already been taken")
      end
        
      it "invalid when email exists in different cases" do
        @new_user = User.create(
          name:                  "Test3",
          last_name:             "User3",
          email:                 "TEST@TEST.COM",
          password:              "password",
          password_confirmation: "password"
          )
          expect(@new_user).to be_invalid
          # puts @new_user.errors.full_messages()
          expect(@new_user.errors.full_messages).to include("Email has already been taken")
      end
  end
        
  describe '.authenticate_with_credentials' do
    # examples for this class method here
    before(:each) do      
      @test_user = User.new(
          name:                  "Test",
          last_name:             "User",
          email:                 "test@test.com",
          password:              "password",
          password_confirmation: "password"
        )
          
          
    end

    it " " do

    end
  end
        
end
      