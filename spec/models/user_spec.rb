require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    it 'ensures username presence' do
      user = User.new(email: 'Email@email.com', password: 'Password').save
      expect(user).to eq(false)

    end

  end
  
end
