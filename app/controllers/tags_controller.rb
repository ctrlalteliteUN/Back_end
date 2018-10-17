class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :update, :destroy]
  before_action :set_post

  # GET /tags
  def index
    render json: @post.tags
  end

  # GET /tags/1
  def show
    render json: @tag
  end

  # POST /tags
  def create
    @tag = Tag.new(tag_params)
    #association between post

    if @tag.save
      @post_has_tag = PostHasTag.new(tag_id: @tag.id, post_id: params[:post_id])
      if @post_has_tag.save
        render json: @tag, status: :created, location: @tag
      end
    else
      render json: @tag.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tags/1
  def update
    if @tag.update(tag_params)
      render json: @tag
    else
      render json: @tag.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tags/1
  def destroy
    @tag.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:post_id])
    end

    def set_tag
      @tag = Tag.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tag_params
      params.require(:tag).permit(:name)
    end
end
