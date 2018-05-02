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

  def create
    logger.debug staff_params[:userId]
    @user = User.find_by(id: staff_params[:userId])
    @staff = @user.staff.build(staff_params)
    if @staff.save
      flash[:info] = "Staff member has been added"
      redirect_to root_url
    else
      @staff.errors.full_messages
      render 'new'
    end
  end

  def index
    @staffs = Staff.paginate(page: params[:page])
  end

  def show
    @staff = Staff.find(params[:id])
  end

  private

  def staff_params
    params.require(:staff).permit(:dentalNumber, :userId, :phoneNumber)
  end
end