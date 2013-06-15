class Image < ActiveRecord::Base
  belongs_to :user
  has_one :app

  attr_accessible :id, :is_public
end
