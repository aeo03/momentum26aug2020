class CreateUserTest < ActionDispatch::IntegrationTest
    test '1. should go to new user form and create user' do
        get new_user_url
        assert_response :success
        assert_difference 'User.count', 1 do
            post users_url, params: {user: { username: "username1", email: "Email1@email.com" , password: "password123" } } 
            assert_response :redirect
        end
        # follow_redirect!
        # assert_response :success
    end
end
