class Api::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def login
    valid = User.find_by(email: params[:email]).valid_password?(params[:password])
    if valid
      @user = User.find_by(email: params[:email])
      @user.api_token = Devise.friendly_token.to_s
      @user.save
      respond_to do |format|
        format.json { render json: @user.api_token, status: :ok }
      end
    else
      respond_to do |format|
        format.json { render json: 'Wrong email or password'.to_json, status: :ok }
      end
    end
  end
end
