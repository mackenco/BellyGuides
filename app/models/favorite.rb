class Favorite < ActiveRecord::Base
  attr_accessible :map_id, :user_id

  belongs_to :map
  belongs_to :user
end
