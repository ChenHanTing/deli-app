class ArticlesController < ApplicationController
  before_action :set_article, only: %i(edit update destroy)

  def index
  end

  def new
  end

  def edit
  end

  def update
    if @article.update(article_params)
      flash[:notice] = '更新成功'
    else
      flash[:alert] = '更新失敗'
    end

    redirect_to articles_path
  end

  def create
    if Article.create(article_params)
      flash[:notice] = '新增成功'
    else
      flash[:alert] = '新增失敗'
    end

    redirect_to articles_path
  end

  def destroy
    if @article.destroy
      flash[:notice] = '刪除成功'
    else
      flash[:alert] = '刪除失敗'
    end

    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find_by_id(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content, :blog_id, :link)
  end
end
