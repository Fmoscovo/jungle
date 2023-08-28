require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) {
    User.new(
      email: 'test@test.com',
      password: 'password123',
      password_confirmation: 'password123',
      first_name: 'Test',
      last_name: 'User'
    )
  }

  describe 'Validations' do
    it 'should be valid with valid attributes' do
      expect(user).to be_valid
    end

    it 'is not valid without an email' do
      user.email = nil
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("Email can't be blank")
    end

    it 'is not valid if email is not unique' do
      user.save!
      user2 = User.new(email: 'TEST@TEST.COM', password: 'password123', password_confirmation: 'password123', first_name: 'Another', last_name: 'User')
      expect(user2).to_not be_valid
      expect(user2.errors.full_messages).to include("Email has already been taken")
    end

    it 'is not valid without a first_name' do
      user.first_name = nil
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("First name can't be blank")
    end

    it 'is not valid without a last_name' do
      user.last_name = nil
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'is not valid if password is below the minimum length' do
      user.password = 'pa'
      user.password_confirmation = 'pa'
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("Password is too short (minimum is 3 characters)")
    end
  end

  describe '.authenticate_with_credentials' do
    before do
      user.save!
    end

    it 'does not authenticate with incorrect credentials' do
      authenticated_user = User.authenticate_with_credentials('test@test.com', 'wrongpassword')
      expect(authenticated_user).to be_nil
    end

    it 'authenticates when email has spaces before or after' do
      authenticated_user = User.authenticate_with_credentials('  test@test.com  ', 'password123')
      expect(authenticated_user).to eq(user)
    end

    it 'authenticates with email in different case' do
      authenticated_user = User.authenticate_with_credentials('TEST@TEST.COM', 'password123')
      expect(authenticated_user).to eq(user)
    end
  end
end
