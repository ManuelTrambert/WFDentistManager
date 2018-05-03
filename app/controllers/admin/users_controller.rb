class Admin::UsersController < AdminController

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def new
    @user = User.new
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    @appointment = Appointment.find(staff_id: params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :status)
  end
end