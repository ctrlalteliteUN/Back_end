class ApplicationController < ActionController::API

 include ActionController::MimeResponds
 


    private

    def token_auth(token,id)
        user = User.find(id)
        if user.authentication_token == token
            return true
        else
            return false
        end

    end


#  acts_as_token_authentication_handler_for User
#
#  private
#
#    def after_successful_token_authentication
#      # Make the authentication token to be disposable - for example
#      renew_authentication_token!
#    end
end
