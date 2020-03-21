# frozen_string_literal: true

class Api::V1::UsersController < ApplicationController

  before_action :find_user, only: [:show]

  def index
    users = User.all
    render json: users, include: [:projects => {include: :users}], except: [:password_digest]
  end

  def show
    # user = User.find(params[:id])
    render json: user, include: [:projects => {include: :users}], only: [:id, :name, :email]
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
      cookies['logged_in'] = true
      render json: user, except: [:password_digest], status: 200
    else
      render json: { errors: user.errors.full_messages }, status: 400
    end
  end

  def update
    # user = User.find(params[:id])
    user = current_user
    if user.update(user_params)
      render json: user, except: [:password_digest]
    else
      render json: user.errors, status: 401
    end
  end
  
  private

  def find_user
    user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation, :city, :state, :country)
  end
end
