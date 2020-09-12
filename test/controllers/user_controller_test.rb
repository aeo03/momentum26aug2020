require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

    setup do 
        @user = User.create(username: "username", email: "email@email.com", password: "password123")
        
        sign_in_as(@user)
    end

    test "1. should get index" do
        get users_url
        assert_response :success
    end

    test "2. should get new" do
        get new_user_url
        assert_response :success
    end

    test "3. should create User" do
        post users_url, params: {user: { username: "username1", email: "Email1@email.com" , password: "password123" } } 
        assert_response :redirect
    end

    test "1. should get edit" do
        get edit_user_url(1)
        assert_response :success
    end

    test "2. User should update" do
        patch user_url(@user), params: {user: { username: "username2", email: "Email2@email.com" , password: "password123" } }
        assert_response :redirect
    end

    test '3. User must be deleted' do
        user = User.find_by(username:@user.username)
        assert_difference "User.count", -1 do
          delete user_url(user)
        end
      end

end
