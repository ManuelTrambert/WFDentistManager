class Admin::StaffsController < AdminController

  def edit
    @staff = Staff.find(params[:id])
  end

  def update
    @staff = Staff.find(params[:id])
    if @staff.update_attributes(staff_params)
      flash[:success] = "Profile updated"
      redirect_to @staff
    else
      render 'edit'
    end
  end

  def new
    @staff = Staff.new
  end

  def index
    @staffs = Staff.paginate(page: params[:page])
  end

  def show
    @staff = Staff.find(params[:id])
  end

  private

  def staff_params
    params.require(:staff).permit(:first_name, :last_name, :email, :status)
  end
end