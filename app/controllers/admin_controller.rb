class AdminController < ApplicationController
  before_action :authorized?

  private
  def authorized?
    unless current_user.admin? || current_user.status == 2 || current_user.status == 1
      flash[:error] = "You are not authorized to view that page."
      redirect_to root_path
    end
  end
end