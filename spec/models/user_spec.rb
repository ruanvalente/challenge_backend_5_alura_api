require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { User.create(email: 'johann@example.com', password: '123456', password_confirmation: '123456') }

  describe 'validations' do
    context 'should validate presence of the field' do
      it { should validate_presence_of(:email) }
    end
  end

  describe 'validates' do
    context 'when creating a new user' do
      it {
        user = User.first

        expect(user).to be_valid
        expect(User.count).to eq(1)
        expect(user).to have_attributes(
          email: user.email
        )
      }
    end
  end

  describe 'invalid' do
    context 'does not create a new user unless email is valid' do
      it {
        expect { User.create! }.to raise_error(ActiveRecord::RecordInvalid)
      }
    end
  end
end
