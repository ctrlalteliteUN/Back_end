class UserMailer < ApplicationMailer
  
  def welcome_email (user)

    @user = user
    @url  = 'https://knowledge-community-front-end.herokuapp.com'
    mail(to: @user.email,from: "Knowledge Community <knowledgecommunityun@gmail.com>" ,subject: 'Bienvenido a Knowledge Community!')
  end

  def one_week_email (user)

    @user = user
    @url  = 'https://knowledge-community-front-end.herokuapp.com'
    @url2  = 'knowledgecommunityunatencion@gmail.com'
    mail(to: @user.email,from: "Knowledge Community <knowledgecommunityun@gmail.com>" ,subject: 'Haces parte de Knowledge Community desde hace una semana!')
  end

  def closed_account
    @user = params[:user]
    @motivo = params[:reason]
    mail(to: @user.email,from: "Knowledge Community <knowledgecommunityun@gmail.com>" ,subject: 'Notificación Importante de su Cuenta')
  end
end
