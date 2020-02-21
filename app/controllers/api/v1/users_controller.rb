# frozen_string_literal: true

class Api::V1::UsersController < ApplicationController

  def index
    users = User.all
    render json: users
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  def new
    user = User.new
    render json: user, status: 200
  end
  
  def create
    # binding.pry
    user = User.new(user_params)
    if user.save
      log_in(user)
      # session[:user_id] = user.id
      cookies['logged_in'] = true
      render json: user, except: [:password_digest], status: 200
    else
      render json: { errors: user.errors.full_messages }, status: 400
    end
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      render json: user
    else
      render json: user.errors, status: 401
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
