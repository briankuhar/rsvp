class PostsController < ApplicationController
  layout :blog_layout
  
  before_action :authenticate_admin, only: [:new, :create, :edit, :manage]
  
  def index
    @posts = Post.all.order(created_at: :desc).paginate(:page => params[:page], :per_page => 3)
  end
  
  def manage
    @posts = Post.all.order(created_at: :desc).paginate(:page => params[:page], :per_page => 20)
  end
  
  def new
    @user = current_user
    @post = @user.posts.new
  end
  
  def create
    @user = current_user
    @post = @user.posts.new(post_params)
    if @post.save
      redirect_to blog_path
    else
      render 'new'
    end
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to '/blog/manage'
    else
      render 'edit'
    end
  end
  
  def destroy
    Post.find(params[:id]).destroy
    redirect_to '/blog/manage'
  end
  
  private
  
    def authenticate_admin
      current_user.is_admin?
    end
  
    def post_params
      params.require(:post).permit(:id, :title, :body, :user_id)
    end
    
    def blog_layout
      if !current_user.nil? and current_user.is_admin?
        "application"
      else
        "static"
      end
    end
end
