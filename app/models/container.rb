class Container < ActiveRecord::Base
  belongs_to :app
  belongs_to :host

  attr_accessible :cid, :app, :host, :port

  def start
    self.port = rand(8000..9000)

    docker = Docker::API.new(base_url: "http://" + self.host.ip + ":" + self.host.port.to_s)
    result = docker.containers.create([], self.app.latest_image.id, {
      "Memory" => APP_CONFIG.container.memory,
      "CpuShares" => APP_CONFIG.container.cpu,
      "PortSpecs" => [self.port],
      "Env" => ['PORT=' + self.port, 'ENVIRONMENT=production']
    })

    self.cid = result["Id"]
    docker.containers.start(self.cid)

    self.save
  end

  def logs
    docker = Docker::API.new(base_url: "http://" + self.host.ip + ":" + self.host.port.to_s)
    docker.containers.logs(self.cid)
  end

  def stop
    docker = Docker::API.new(base_url: "http://" + self.host.ip + ":" + self.host.port.to_s)
    docker.containers.stop(self.cid)
    docker.containers.remove(self.cid)
  end
end
