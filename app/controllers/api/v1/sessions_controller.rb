# frozen_string_literal: true

class Api::V1::SessionsController < ApplicationController
  def login
    # binding.pry
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      log_in(user)
      cookies['logged_in'] = true
      render json: user, status: 200
    else
      render json: { error: 'error' }, status: 401
    end
  end

  def auth_check
    cookies['logged_in'] = logged_in?
    render json: { csrf_auth_token: form_authenticity_token }
  end

  def logout
    session.clear
    cookies['logged_in'] = logged_in?
    render json: { message: "Logged out" }, status: 200
  end

  def auto_login
    # binding.pry
    if logged_in?
      user = current_user
      render json: user, status: 200
    else
      render json: { error: 'Not logged in' }
    end
  end

  private

  def auth
      request.env['omniauth.auth']
  end

end
