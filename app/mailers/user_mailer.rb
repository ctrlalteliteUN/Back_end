class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'
 
  def welcome_email
    @user = params[:user]
    @url  = 'https://knowledge-community-front-end.herokuapp.com'
    mail(to: @user.email, subject: 'Bienvenido a Knowledge Community!')
  end
  
  def closed_account
    @user = params[:user]
    @motivo = params[:reason]
    mail(to: @user.email, subject: 'Notificación Importante de su Cuenta')
  end
end
