class UsersController < ApplicationController
  def login
    user = User.find_by(name: params[:user][:name])

    user = User.new(name: params[:user][:name], join_date: Date.today) if user.nil?
    if user.save
      session[:user_id] = user.id
      flash[:success] = "Welcome #{user.name}."
      redirect_to root_path
    else
      flash.now[:danger] = "User not created."
      user.errors.messages.each do |field, messages|
        flash.now[field] = messages
      end
      render :new
    end
  end

  def new
    @user = User.new
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Successfully logged out."
    redirect_back fallback_location: root_path
  end

  def index
    @current_user = User.find_by(id: session[:user_id])
    @users = User.all
  end
end
