class NewsController < ApplicationController
  before_action :logged_in_user, only: [:index]
  before_action :admin_user, only: [:destroy, :edit]

  def index
    @news = News.paginate(page: params[:page])
  end

  private

  def news_params
    params.require(:news).permit(:text)
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

end