module ApplicationHelper
  def is_admin?
    current_user.role&.name == "admin"
  end

  def is_registered?
    current_user.role&.name == "registered" || current_user.role&.name.nil?
  end

  def is_banned?
    current_user.role&.name == "banned"
  end

  def index(model)
    if is_admin?
      model.all.each
    elsif is_registered?
      block_given? ? yield : model.where(user: current_user)
    else
      model.none
    end
  end

  def username
    current_user.name || current_user.email.split("@").first
  end
end
