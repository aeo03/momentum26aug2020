require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

    setup do 
        @user = User.create(username: "username", email: "email@email.com", password: "password123")
        
        sign_in_as(@user)
    end

    test "should get index" do
        get users_url
        assert_response :success
    end

    test "should get new" do
        get new_user_url
        assert_response :success
    end

    test "should create User" do
        post users_url, params: {user: { username: "username1", email: "Email1@email.com" , password: "password123" } } 
        assert_response :redirect
    end

    test "should get edit" do
        get edit_user_url(1)
        assert_response :success
    end

    test "User should update" do
        get edit_user_url(1)
        assert_recognizes({ :controller => 'users',
                        :action => 'update',
                        :id => '1'},
                        :path => 'users/1',
                        :method => :patch)
        # assert_response :redirect
    end

    test "User should delete" do
        get user_url(1)
        assert_recognizes({ :controller => 'users',
                        :action => 'destroy',
                        :id => '1' },
                        :path => 'users/1',
                        :method => :delete)
        # assert_response :redirect
    end
end
