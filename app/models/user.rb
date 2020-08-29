class User < ApplicationRecord
    validates :username, presence: true, length: { minimum: 3, maximum: 25 }, uniqueness: true
    validates :email, presence: true, length: { minimum: 3, maximum: 105 }, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "Please enter a valid email"}

    before_save { self.email = email.downcase }
    has_secure_password
end
