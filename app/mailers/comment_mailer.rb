class CommentMailer < ApplicationMailer
  default from: 'notifications@example.com'
 
  def Created
    @user = params[:user]
    @post = params[:post]
    @commenter_name = params[:commenter_name]
    @contenido = params[:contenido]
    if @contenido.lenght > 20
      @contenido = "#{@contenido[0..10]}..."
    end
    mail(to: @user.email, subject: 'Actividad en tu post\'#{@post.title}\'')
  end
end
