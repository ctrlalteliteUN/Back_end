class SessionsController < ApplicationController


  def create
    @user = User.where(email: params[:email]).first

    #render json:  @user
    if @user.valid_password?(params[:password])
      #render json: @user.as_json(only: [:id,:email,:authentication_token]), status: :created
      render :create, status: :created
      
      #render json: output = {'email' => 'la mama del crespo '}.to_json

    else
      head(:unauthorized)
    end

  end

  def destroy
    @user = User.where(email: params[:email]).first
    @user.authentication_token = nil
    @user.save
    render :destroy,status: :destroy
  end




end
