class User < ActiveRecord::Base
  attr_accessible :email, :flag_admin, :password, :password_confirmation, :password_hash

  has_many :apps
  has_many :images

  acts_as_authentic
end
