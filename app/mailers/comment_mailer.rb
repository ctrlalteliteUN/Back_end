class CommentMailer < ApplicationMailer
 
  def CommmentCreated
    @user = params[:user]
    @post = params[:post]
    @commenter_name = params[:commenter_name]
    @contenido = params[:contenido]
    if @contenido.length > 20
      @contenido = "#{@contenido[0..10]}..."
    end
    mail(to: @user.email,from: "Knowledge Community <knowledgecommunityun@gmail.com>" , subject: "Actividad en el post '#{@post.title}'")
  end
  def Deleted
    @user = params[:user]
    @post = params[:post]
    @motivo = params[:reason]
    mail(to: @user.email,from: "Knowledge Community <knowledgecommunityun@gmail.com>" , subject: "Comentario eliminado en '#{@post.title}'")
  end
end
