class UsersController < ApplicationController
  before_action :is_admin
  before_action :set_user, only: %i(edit update destroy)

  def index
  end

  def edit
  end

  def update
  end

  def destroy

  end

  private

  def is_admin
    redirect_to :root unless current_user.role&.name == "admin"
  end

  def set_user
    @user = User.find_by_id(params[:id])
  end
end
