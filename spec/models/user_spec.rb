require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "should include a password field and a password confirmation field" do
        @user = User.new(
          firstname: "Shenglun",
          lastname: "Jin",
          email:"test@test.com",
          password: "123",
          password_confirmation: "123"
        )
        @user.save!
        expect(@user.id).to be_present

    end

    it "should return error if the two filed do not have identical password" do
      @user = User.new(
        firstname: "Shenglun",
        lastname: "Jin",
        email:"test@test.com",
        password: "123",
        password_confirmation: "321"
      ) 
      @user.validate
      expect( @user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "should only allow unique email " do
      @user1 = User.new(
        firstname: "Shenglun",
        lastname: "Jin",
        email:"test@test.com",
        password: "123",
        password_confirmation: "123"
      )
      @user1.save!
      @user2 = User.new(
        firstname: "Shenglun",
        lastname: "Jin",
        email:"test@test.com",
        password: "123",
        password_confirmation: "123"
      )  
      @user2.validate

      expect( @user2.errors.full_messages).to include("Email has already been taken")

    end
    
    it "should create user with validate email" do
      @user = User.new(
        firstname: "Shenglun",
        lastname: "Jin",
        password: "123",
        password_confirmation: "321"
      ) 
      @user.validate
      expect( @user.errors.full_messages).to include("Email can't be blank")
    end

    it "should create user with validate firstname" do
      @user = User.new(
        lastname: "Jin",
        email:"test@test.com",
        password: "123",
        password_confirmation: "321"
      ) 
      @user.validate
      expect( @user.errors.full_messages).to include("Firstname can't be blank")
    end

    it "should create user with validate lastname" do
      @user = User.new(
        firstname: "Shenglun",
        email:"test@test.com",
        password: "123",
        password_confirmation: "321"
      ) 
      @user.validate
      expect( @user.errors.full_messages).to include("Lastname can't be blank")
    end

    it "should return error if password length less than 3" do
      @user = User.new(
        firstname: "Shenglun",
        lastname: "Jin",
        email:"test@test.com",
        password: "12",
        password_confirmation: "12"
      ) 
      @user.validate
      expect( @user.errors.full_messages).to include("Password is too short (minimum is 3 characters)")
    end
  end

  describe '.authenticate_with_credentials' do
    

    it "should return a valid user if pass authentication" do
      @user=User.new(
        firstname: "Shenglun",
        lastname: "Jin",
        email:"test@test.com",
        password: "123",
        password_confirmation: "123"
      )    
      @user.save!
      user = User.authenticate_with_credentials("test@test.com","123")
      
      expect(user.id).to be_present
    end

    it "should return nil if fail authentication" do
      @user=User.new(
        firstname: "Shenglun",
        lastname: "Jin",
        email:"test@test.com",
        password: "123",
        password_confirmation: "123"
      )    
      @user.save!
      user = User.authenticate_with_credentials("test@abc.com","123")
      
      expect(user).to eq(nil)
    end
   
    describe 'edge case' do

      it "should authenticated successfully if user accidentally enter space in their email" do
        @user=User.new(
          firstname: "Shenglun",
          lastname: "Jin",
          email:"test@test.com",
          password: "123",
          password_confirmation: "123"
        )    
        @user.save!
        user = User.authenticate_with_credentials("test@    test.com","123")
        
        expect(user.id).to be_present
      end
     
      it "should authenticated successfully if user accidentally enter uppercase in their email" do
        @user=User.new(
          firstname: "Shenglun",
          lastname: "Jin",
          email:"test@test.com",
          password: "123",
          password_confirmation: "123"
        )    
        @user.save!
        user = User.authenticate_with_credentials("teSt@    test.coM","123")
        
        expect(user.id).to be_present
      end
    end

  end

  
end
