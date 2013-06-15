class AppsController < ApplicationController
  def index
    unless current_user.nil?
      @apps = current_user.apps
    else
      flash[:error] = "You must login/register before you can access this."
      redirect_to '/'
    end
  end

  def create
    unless current_user.nil?
      @app = App.new
    else
      flash[:error] = "You must login/register before you can create an application."
      redirect_to '/'
    end
  end

  def create_post
    unless current_user.nil?
      @app = App.new(params[:app])

      @app.user = current_user
      @app.save
      redirect_to :apps_index
    else
      flash[:error] = "You are not authorized to access this."
      redirect_to '/'
    end
  end

  def get
    @app = App.find(params[:id])

    if current_user.nil? || @app.user_id != current_user.id
      flash[:error] = "You are not authorized to access this."
      redirect_to '/'
    end
  end
end
