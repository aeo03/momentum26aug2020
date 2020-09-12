require 'test_helper'

class TagsControllerTest < ActionDispatch::IntegrationTest
    #need pa ba to? Nag ccreate ba ng parallel instances sa testing?
    setup do 
        @user = User.create(username: "username", email: "email@email.com", password: "password123")
        
        sign_in_as(@user)
    end

    test "7. should get index" do
        get tags_url
        assert_response :success
    end

    test "8. should get new" do
        get new_tag_url
        assert_response :success
    end

    test "9. should create Tag" do
        post tags_url, params: {tag: { tag_name: "tag name"} } 
        assert_response :redirect
    end

end
