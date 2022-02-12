class UsersController < ApplicationController
  before_action :is_admin

  def index
  end

  def edit
  end

  private

  def is_admin
    redirect_to :root unless current_user.role&.name == "admin"
  end
end
