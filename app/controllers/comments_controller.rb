class CommentsController < ApplicationController
  before_action set_post_comment
  def create
    @comment = @post.comments.build(comment_params)
    # @comment.user = current_user
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @post, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { redirect_to @post, alert: 'Failed to create comment.' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_post_comment
    @post = Post.find(params[:post_id])
  end
end
