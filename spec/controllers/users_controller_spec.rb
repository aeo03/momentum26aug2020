require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    context 'GET #index' do
        it 'returns a success response' do

            user = User.create(username: "username", email: "email@email.com", password: "password123")

            post auth_user_path, params: { username: user.username, password: "password123" }

            get :index
            expect(response).to be_success # response.success?
        end
    end
end
