class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :create]
  def index
    post_ids = Like.group(:post_id).order('count_post_id DESC').limit(5).count(:post_id).keys
    @posts = post_ids.map { |id| Post.find(id) }
  end

  def item
    @posts = Post.order("created_at DESC").page(params[:page]).per(9)
    @post = Post.new
  end

  def ranking
    post_ids = Like.group(:post_id).order('count_post_id DESC').count(:post_id).keys
    posts = post_ids.map { |id| Post.find(id) }
    @posts = Kaminari.paginate_array(posts).page(params[:page]).per(9)
  end

  def search
    @posts = Post.search(params[:search]).page(params[:page]).per(9)
  end


  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    unless @post.save
      render 'new'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.user_id == current_user.id
      @post.destroy
      redirect_to root_path
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    if post.user_id == current_user.id
      post.update(post_params)
      redirect_to root_path
    end
  end

  def show
    @post = Post.find(params[:id])
    @like= Like.new
    @comments = @post.comments
    @comment = Comment.new
  end

  private
  def post_params
    params.require(:post).permit(:about, :image, :name, :name_id).merge(user_id: current_user.id)
  end
end
