require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with matching password and password_confirmation' do
    user = User.new(
      email: 'test@example.com',
      password: 'password',
      password_confirmation: 'password'
    )
    expect(user).to be_valid
  end


  
end