class UsersController < ApplicationController
  def index
  end

  def login
  	@user_session = UserSession.new
  end

  def login_create
  	@user_session = UserSession.new(params[:user_session])

  	if @user_session.save
  		redirect_to :apps_index
  	else
  		render "login"
  	end
  end

  def logout
  	@user_session = UserSession.find
  	@user_session.destroy

  	redirect_to "/"
  end

  def register
  	@user = User.new
  end

  def register_post
  	@user = User.new(params[:user])

  	if @user.save
  		redirect_to :apps_index
  	else
  		render "register"
  	end
  end
end
