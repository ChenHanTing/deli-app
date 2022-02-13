class BlogsController < ApplicationController
  before_action :set_blog, only: %i(edit update destroy)

  def index
  end

  def new
  end

  def edit
  end

  def update
    if @blog.update(blog_params)
      flash[:notice] = '更新成功'
    else
      flash[:alert] = '更新失敗'
    end

    redirect_to blogs_path
  end

  def create
    if current_user.blogs.create(blog_params)
      flash[:notice] = '新增成功'
    else
      flash[:alert] = '新增失敗'
    end

    redirect_to blogs_path
  end

  def destroy
    if @blog.destroy
      flash[:notice] = '刪除成功'
    else
      flash[:alert] = '刪除失敗'
    end

    redirect_to blogs_path
  end

  private

  def set_blog
    @blog = Blog.find_by_id(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:name)
  end
end
