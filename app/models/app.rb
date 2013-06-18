class App < ActiveRecord::Base
  belongs_to :user
  belongs_to :image
  has_many :container

  attr_accessible :name, :github_url, :github_key

  def create_git
    # Create Git Repository and setup hooks
  end
end
