require 'httparty'
require 'json'
require "googleauth/token_validator"

class AuthorizationController < ApplicationController
=begin
include HTTParty

 def get_authorization
   url = "https://www.googleapis.com/oauth2/v3/tokeninfo?id_token=#{params["id_token"]}"
   response = HTTParty.get(url)
   @user = User.create_user_for_google(response.parsed_response)
   tokens = @user.create_new_auth_token
   @user.save
   render json:@user
=end

  def get_authorization
    client_id = "373142330185-hko54qc5fakooerj23p6n1494vj768h4.apps.googleusercontent.com"
    id_token = params[:id_token]
    pecheo = "no se ejecuta"
    begin
      valid = Google::Auth::TokenValidator.new(id_token, client_id).validate
    rescue Google::Auth::TokenValidator::Error => e
      pecheo = e.message
      valid = false
    end
    #valid = true
    if valid
      @user = User.where(email: params[:email]).first
      if @user != nil
        @user.authentication_token = nil
        @user.save
      else
        @user = User.create(email:params[:email],name: params[:name] )
      end
      render json: output = {'authentication_token' => @user.authentication_token }.to_json
    else
      render json: output = {'email' => 'la puta madre no funciona' , 'error' => pecheo }.to_json
    end
  end

end
