require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'is valid with matching password and password_confirmation' do
      @user = User.create(
        firstname: 'Bob',
        lastname: 'Joe',
        email: 'test@test.com',
        password: 'password',
        password_confirmation: 'password'
      )
    expect(@user.password).to eq(@user.password_confirmation)
    end

    it 'is not valid if the password and password_confirmation is not the same value.' do
      @user = User.create(
        firstname: 'Bob',
        lastname: 'Joe',
        email: 'test@test.com',
        password: 'password',
        password_confirmation: 'not-password'
      )
    expect(@user).not_to be_valid
    end

    it 'does not save if there is no email inputted.' do
      @user = User.create(
        firstname: 'Bob',
        lastname: 'Joe',
        email: nil,
        password: 'password',
        password_confirmation: 'password'
      )
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'does not save if last name is not inputted.' do
      @user = User.create(
        firstname: nil,
        lastname: 'Joe',
        email: 'test@test.com',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(@user).not_to be_valid
    end

    it 'does not save if first name is not inputted.' do
      @user = User.create(
        firstname: 'Bob',
        lastname: nil,
        email: 'test@test.com',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(@user).not_to be_valid
    end
    
    it 'does not save if a user with that email already exists regardless of case' do
      @user1 = User.create(
        firstname: 'Bob',
        lastname: 'Joe',
        email: 'test@test.com',
        password: 'password',
        password_confirmation: 'password'
      )
      @user2 = User.create(
        firstname: 'Bob',
        lastname: 'Joe',
        email: 'TEST@test.com',
        password: 'password',
        password_confirmation: 'password'
      )

      expect(@user2).not_to be_valid
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end

    it 'does not save if the password is less than 7 characters' do
      @user1 = User.create(
        firstname: 'Bob',
        lastname: 'Joe',
        email: 'testing@test.com',
        password: 'password',
        password_confirmation: 'password'
      )
      @user2 = User.create(
        firstname: 'Bob',
        lastname: 'Joe',
        email: 'testing1@test.com',
        password: '2short',
        password_confirmation: 'password'
      )
      expect(@user1).to be_valid
      expect(@user2).not_to be_valid
    end
  end

  describe '.authenticate_with_credentials' do 
    it 'returns a user instance if email and password are correct.' do
    @user = User.create(
      firstname: 'Bob',
      lastname: 'Joe',
      email: 'test@test.com',
      password: 'password',
      password_confirmation: 'password'
    )
    user_authenticated = User.authenticate_with_credentials('test@test.com', 'password')
    expect(user_authenticated.email).to eq(@user.email)
  end

  it 'returns valid if the user has whitespaces before or after their email.' do
    @user = User.create(
      firstname: 'Bob',
      lastname: 'Joe',
      email: 'test5@test.com',
      password: 'password',
      password_confirmation: 'password'
    )
    user_authenticated = User.authenticate_with_credentials(' test5@test.com ', 'password')

    expect(user_authenticated).to eq(@user)

  end
end

end