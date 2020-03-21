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

  def googleAuth
    # Get access tokens from the google server
    access_token = request.env['omniauth.auth']
    # binding.pry
    user = User.from_omniauth(access_token)
    binding.pry

    # Access_token is used to authenticate request made from the rails application to the google server
    user.google_token = access_token.credentials.token
    # Refresh_token to request new access_token
    # Note: Refresh_token is only sent once during the first request
    refresh_token = access_token.credentials.refresh_token
    user.google_refresh_token = refresh_token if refresh_token.present?
    if user.save
      log_in(user)
      redirect_to 'http://localhost:3000'
    else
      # redirect_to 'http://localhost:3000'
      render json: { message: "Login incorrect, try again" }
      # redirect_to login_path
    end
  end

  private

  def auth
      request.env['omniauth.auth']
  end

end
