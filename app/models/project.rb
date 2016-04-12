class Project < ActiveRecord::Base
  belongs_to :user
  has_many :pictures

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
              in: 5..500,
              message: "length should be between 5 and 500 characters"
            }
end
