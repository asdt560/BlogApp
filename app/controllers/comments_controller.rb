class CommentsController < ApplicationController
  load_and_authorize_resource except: :create
  def create
    puts params
    @comment = current_user.comments.new(params.require(:comment).permit(:text))
    @comment.post = Post.find(params[:post_id])
    if @comment.save
      flash[:success] = 'Comment created successfully'
    else
      flash[:error] = 'Something went wrong'
      puts 'error'
    end
    redirect_to user_post_path(@comment.post.author, @comment.post)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    @post = Post.find(@comment.post_id)
    @post.decrement!(:comments_counter)
    redirect_to @comment.post
  end
end
