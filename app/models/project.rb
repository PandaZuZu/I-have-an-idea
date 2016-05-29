class Project < ActiveRecord::Base
  belongs_to :user
  has_many :pictures
  serialize :pictures
  mount_uploaders :pictures, PictureUploader

  validates :title,
            :uniqueness => true,
            :presence => true,
            :length => {
              in: 5..50,
              message: "length should be between 5 and 50 characters"
            }

  validates :description,
            :presence => true,
            :length => {
              in: 5..5000,
              message: "length should be between 5 and 5000 characters"
            }
end
