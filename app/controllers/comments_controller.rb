class CommentsController < ApplicationController
  before_action :set_post_comment, only: %i[show edit update destroy create]
  before_action :authenticate_user!, except: %i[show create]
  before_action :authorize_comment_edit, only: %i[edit update destroy]

  def create
    @comment = user_signed_in? ? @post.comments.build(comment_params.merge(author: current_user.email)) : @post.comments.build(comment_params)
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

  def edit; end

  def update; end

  def destroy; end

  private

  def set_post_comment
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:author, :content)
  end

  def authorize_comment_edit
    return if current_user.admin? || @comment.user == current_user

    redirect_to root_path, alert: 'You are not authorized to perform this action.'
  end
end
