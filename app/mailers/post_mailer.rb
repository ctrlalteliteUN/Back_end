class PostMailer < ApplicationMailer
  default from: 'notifications@example.com'
  
  def Post
    @user = params[:user]
    @post = params[:post]
    mail(to: @user.email,from: "Knowledge Community <knowledgecommunityun@gmail.com>" , subject: 'Post creado correctamente')
  end
  
  def Deleted
    @user = params[:user]
    @post = params[:post]
    @motivo = params[:reason]
    mail(to: @user.email,from: "Knowledge Community <knowledgecommunityun@gmail.com>" , subject: 'Post \'#{@post.title}\' eliminado')
  end
end
