class ArticlesController < ApplicationController
  before_action :set_article, only: %i(edit update destroy)

  def index
  end

  def new
  end

  def edit
  end

  def update
  end

  def create
  end

  def destroy
  end

  private

  def set_article
    @article = Article.find_by_id(params[:id])
  end
end
