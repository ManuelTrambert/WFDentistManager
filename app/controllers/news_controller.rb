class NewsController < ApplicationController
  before_action :logged_in_user, only: [:index]
  before_action :admin_user,     only: [:destroy, :edit]

  def index
    @news = News.paginate(page: params[:page])
  end
  
  def show
    @news = News.find(params[:id])
  end

  def new
    @News = News.new
    redirect_to root_url
  end

  def create
    @news = News.new(news_params)
    end
  end

  def edit
    @news = News.find(params[:id])
  end

  def update
    @news = News.find(params[:id])
    if @news.update_attributes(user_params)
         flash[:success] = "News updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def destroy
    News.find(params[:id]).destroy
    flash[:success] = "News deleted"
    redirect_to news_url
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