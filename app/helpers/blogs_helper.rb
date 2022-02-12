module BlogsHelper
  def blogs
    index(Blog) { current_user.blogs }
  end
end
