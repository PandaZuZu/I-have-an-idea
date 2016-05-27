class Picture < ActiveRecord::Base
  belongs_to :project
  belongs_to :achievement
end
