class PostsController < ApplicationController
  load_and_authorize_resource except: :create
  def index
    @user = User.includes(:posts).find(params[:user_id])
    @posts = Post.where(author_id: params[:user_id])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  def show
    @post = Post.find(params[:id])
    @author = User.find(params[:user_id])
    @comments = Comment.where(post_id: params[:id])
    @comment = @post.comments.new
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comments }
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit(:title, :text))
    @post.author = current_user
    if @post.save
      flash[:success] = 'Post created successfully'
      redirect_to user_post_path(@post.author, @post)
    else
      flash.now[:error] = 'Something went wrong'
      render :new, status: 422
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.delete!
    redirect_to user_posts_path(@post.author), status: :see_other
  end
end
