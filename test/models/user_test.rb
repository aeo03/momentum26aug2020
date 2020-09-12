require 'test_helper'

class UserTest < ActiveSupport::TestCase

    # Presence

    test "should not save User without username" do
        user = User.new(email: 'Email@email.com', password: 'Password')
        assert_not user.save
    end

    test "should not save User without email" do
        user = User.new(username: 'Username', password: 'Password')
        assert_not user.save
    end

    test "should not save User without pass" do
        user = User.new(username: 'Username', email: 'Email@email.com')
        assert_not user.save
    end

    # Limit

    test "should not save User when username length is less than 3 " do
        user = User.new(username: 'Us', email: 'Email@email.com',  password: 'Password')
        assert_not user.save
    end

    test "should not save User when username length is more than 25 " do
        user = User.new(username: 'a' * 26, email: 'Email@email.com',  password: 'Password')
        assert_not user.save
    end

    test "should not save User when password length is less than 3 " do
        user = User.new(username: 'username', email: 'Em',  password: 'Password')
        assert_not user.save
    end

    test "should not save User when password length is more than 105 " do
        user = User.new(username: 'a' * 26, email: 'a' * 100 + '@email.com',  password: 'Password')
        assert_not user.save
    end

    # Uniqeness

    test "should not save User not unique " do
        user1 = User.new(username: 'username', email: 'Email@email.com',  password: 'Password')
        user1.save
        user2 = user1.dup
        assert_not user2.save
    end

    # format 

    test "should not save User when email is not formatted" do
        user = User.new(username: 'username', email: 'Emailemail.com',  password: 'Password')
        assert_not user.save        
    end

    # Happy path
    
    test "should save User" do
        user = User.new(username: 'Username', email: 'Email@email.com', password: 'Password')
        assert user.save
    end

end