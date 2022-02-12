module ArticlesHelper
  def articles
    index(Article) { Article.where(blog: current_user.blogs) }
  end
end
