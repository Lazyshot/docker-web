require "net/http"
require "uri"
require "json"

class Host < ActiveRecord::Base
  has_many :container
  attr_accessible :ip, :port

  def currentContainers
  	uri = URI.parse("http://" + self.ip + ":" + self.port + "/containers/json?all=1")
  	response = Net::HTTP.get_response(uri)
  	JSON.parse(response.body)
  end
end
