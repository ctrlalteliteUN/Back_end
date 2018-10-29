class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :update, :destroy]
  before_action :set_post

  # GET /comments
  def index
    @comments = Comment.where(post_id: params[:post_id])
    #@comments = Comment.all
    render json: @comments
  end

  # GET /comments/1
  def show
    render json: @comment
  end

  # POST /comments
  def create
    @comment = Comment.new(comment_params)
    #@comment.post_id = params[:post_id]
    @comment.post = @post

    if @comment.save
      #Notificar al dueño del post
      usr = User.find(@post.user_id)
      CommentMailer.with(user: usr,post: @post,commenter_name: User.find(comment_params[:user_id]).name,contenido:comment_params[:body]).CommmentCreated.deliver_later
      #################################
      render json: @comment, status: :created, location: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comments/1
  def update
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /comments/1
  def destroy
    CommentMailer.with(user: User.find(@comment.user_id),post: Post.find(@comment.post_id),reason:params[:reason]).Deleted.deliver_later
    @comment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:post_id])
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def comment_params
      params.require(:comment).permit(:user_id, :post_id, :body)
    end
end
