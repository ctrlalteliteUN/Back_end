class PostMailer < ApplicationMailer
  default from: 'notifications@example.com'
  
  def Post
    @user = params[:user]
    @post = params[:post]
    mail(to: @user.email, subject: 'Post creado correctamente')
  end
end
