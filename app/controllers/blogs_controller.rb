class BlogsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @blogs = Blog.all.order("created_at DESC")
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    unless @blog.save then
      flash.now[:notice] = "投稿に失敗しました"
      render action: :new
    end 
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    unless @blog.update(blog_params) then
      flash.now[:notice] = "更新に失敗しました"
      render action: :new
    end 
  end

  def destroy
    blog = Blog.find(params[:id])
    blog.destroy
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :text)
  end
end
