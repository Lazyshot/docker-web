class Container < ActiveRecord::Base
  belongs_to :app
  belongs_to :host

  attr_accessible :app, :host
end
