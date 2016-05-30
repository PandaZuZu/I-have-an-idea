class User < ActiveRecord::Base

  has_and_belongs_to_many :achievements
  has_many :projects
  has_many :reviews

  attr_accessor :password

  validates :username,
            :uniqueness => true,
            :presence => true,
            :format => {
              :with => /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i,
              :multiline => true,
              message: "is not valid email address"
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
