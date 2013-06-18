class HostsController < ApplicationController
  def index
    @hosts = Host.all
  end

  def get
    @host = Host.find(params[:id])
  end

  def add
    @host = Host.new
  end

  def add_post
    @host = Host.new(params[:host])

    @host.save
    if @host.save
      redirect_to :hosts_index
    else
      render "add"
    end
  end

  def remove
    @host = Host.find(params[:id])
    @host.destroy

    redirect_to :hosts_index
  end
end
