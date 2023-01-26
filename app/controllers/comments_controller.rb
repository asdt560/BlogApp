class CommentsController < ApplicationController
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
end