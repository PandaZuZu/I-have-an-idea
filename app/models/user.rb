class User < ActiveRecord::Base

  has_many :projects

  attr_accessor :password

  validates :username,
            :uniqueness => true,
            :presence => true,
            :format => {
              :with => /^[a-zA-Z0-9]/,
              :multiline => true,
              message: "must contain only letters and numbers"
            },
            :length => {
              in: 5..20,
              message: "length should be between 5 and 20 characters"
            }

  validates :password,
            :presence => true,
            :confirmation => true,
            :length => {
              in: 8..20,
              on: :create,
              message: "length should be between 8 and 20 characters"
            }

  before_save :encrypt_password

  def self.authenticate(username, password)
    user = find_by_username(username)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
