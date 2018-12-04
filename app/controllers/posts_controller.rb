require "#{Rails.root}/app/pdfs/post_pdf.rb"

class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  # GET /posts
  def index

    render json: request.headers["Authorization"]


=begin
    if $granted

      $granted = false

      if params[:body] != nil
        @posts = Post.bodys(params[:body]).paginate(:page => params[:page],:per_page => params[:per_page])

      elsif params[:title]!= nil
        @posts = Post.titles(params[:title]).paginate(:page => params[:page],:per_page => params[:per_page])

      elsif params[:postsTags] != nil
        nombre=Tag.paginate(:page => params[:page],:per_page => params[:per_page]).find_by_name(params[:postsTags]).name
        @posts=Post.pt(nombre)

      else
        if params[:group_id] != nil
          @posts = Post.where(group_id: params[:group_id])
        else
          @posts = Post.paginate(:page => params[:page],:per_page => params[:per_page])
        end
      end

      respond_to do |format|
        format.html do
          render json: @posts
        end

        format.pdf do
          pdf = PostReport.new
          send_data pdf.render,
                    filename: "report.pdf",
                    type: 'application/pdf',
                    disposition: 'inline'
        end
      end
      #render json: @posts
    else
      render json: $granted
    end
=end

  end


  # GET /posts/1
  def show
    if $granted
      $granted = false
      render json: @post
    else
      render json: $granted
    end
  end

  # POST /posts
  def create
    if $granted
      $granted = false
      #----------------------------------------------------------------------
      @post = Post.new(post_params)
      if @post.save
        PostMailer.with(user: User.find(post_params[:user_id]), post: @post).Post.deliver_later
        render json: @post, status: :created, location: @post
      else
        render json: @post.errors, status: :unprocessable_entity
      end
      #-----------------------------------------------------------------
    else
      render json: $granted
    end



  end

  # PATCH/PUT /posts/1
  def update
    if $granted
      $granted = false
      #----------------------------------------------------------------------
      if @post.update(post_params)
        render json: @post
      else
        render json: @post.errors, status: :unprocessable_entity
      end
      #--------------------------------------------------------------------
    else
      render json: $granted
    end
  end

  # DELETE /posts/1
  def destroy
    if $granted
      $granted = false
      #-----------------------------------------------------------------------------------------------
      PostMailer.with(user: User.find(@post.user_id),post: @post,reason:params[:reason]).Deleted.deliver_later
      @post.destroy
      #-------------------------------------------------------------------------------------------
    else
      render json: $granted
    end
  end


  def download_resume
    require 'erb'
    binding_copy = binding
    binding_copy.local_variable_set(:binding ,users: User.all)
    template = File.open(Rails.root.join('app/views/posts/reporte.html.erb'))
    string = ERB.new(template).result(binding_copy)
    pdf = WickedPdf.new.pdf_from_string(string)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_params
      params.require(:post).permit(:user_id, :title, :body, :solicitud, :lat, :lng, :group_id)
    end
end
