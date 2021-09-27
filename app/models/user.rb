class User < ApplicationRecord
    mount_uploader :avatar, AvatarUploader

    validates :name, presence: true, length: {maximum: 30}
    validates :email, presence: true, length: { maximum: 255 },
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    
    before_validation { email.downcase! }
    validates :avatar, presence: true
    
    has_secure_password
    validates :password, length: { minimum: 6 }
end
