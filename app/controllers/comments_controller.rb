class CommentsController < ApplicationController
  before_action :set_post_comment, only: %i[show edit update destroy create new]
  before_action :authenticate_user!, except: %i[show create]
  before_action :authorize_comment_edit, only: %i[edit update destroy]

  def new
    return unless user_signed_in?

    @comment = @post.comments.build
  end

  def show
    @post = Post.find(params[:post_id])
    @comments = @post.comments
  end

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user if user_signed_in?
    @comment.user ||= User.find_by(email: 'anonimo@example.com') # Buscar usuario genérico si no hay usuario conectado
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

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @post, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if current_user.admin? || current_user == @comment.user
      @comment.destroy
      respond_to do |format|
        format.html { redirect_to @post, notice: 'Comment was successfully deleted.' }
        format.json { head :no_content }
      end
    else
      redirect_to @post, alert: 'You are not authorized to delete this comment.'
    end
  end

  private

  def set_post_comment
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id]) if params[:id]
  end

  def comment_params
    params.require(:comment).permit(:author, :content)
  end

  def authorize_comment_edit
    return if current_user.admin? || (@comment && @comment.user == current_user)

    redirect_to root_path, alert: 'You are not authorized to perform this action.'
  end
end
