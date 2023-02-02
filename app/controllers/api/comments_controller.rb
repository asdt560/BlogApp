class Api::CommentsController < ApplicationController
  load_and_authorize_resource

  skip_before_action :verify_authenticity_token

  def index
    @comments = Comment.where(post_id: params[:post_id])
    render json: @comments
  end

  def create
    @user = User.find_by(api_token: params[:key])
    @comment = Comment.new(params.permit(:text, :post_id))
    @comment.author = @user
    if @comment.save
      flash[:success] = 'Comment created successfully'
      render json: @comment, status: :created
    else
      flash[:error] = 'Something went wrong'
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    @post = Post.find(@comment.post_id)
    @post.decrement!(:comments_counter)
    redirect_to @comment.post
  end
end
