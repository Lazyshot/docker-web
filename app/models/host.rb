require 'docker'

class Host < ActiveRecord::Base
  has_many :container
  attr_accessible :ip, :port, :memory, :vcpus

  def currentContainers
    docker = Docker::API.new(base_url: "http://" + self.ip + ":" + self.port.to_s)
    return docker.containers.list
  end
end
