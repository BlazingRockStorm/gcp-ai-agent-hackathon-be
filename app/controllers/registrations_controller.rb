# frozen_string_literal: true

class RegistrationsController < ApplicationController
  allow_unauthenticated_access

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email_address, :password)
  end
end
