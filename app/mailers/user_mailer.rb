class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'
 
  def welcome_email
    @user = params[:user]
    @url  = 'https://knowledge-community-front-end.herokuapp.com'
    mail(to: "saayalac@unal.edu.co", subject: 'Bienvenido a Knowledge Community!')
  end
end
