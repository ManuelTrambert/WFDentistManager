class Admin::AppointmentsController < AdminController

  def edit
    @appointment = Appointment.find(params[:id])
  end

  def update
    @appointment = Appointment.find(params[:id])
    if @appointment.update_attributes(appointment_params)
      flash[:success] = "Profile updated"
      redirect_to root_url
    else
      render 'edit'
    end
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @staff = Staff.find_by(id: appointment_params[:staff_id])
    @patient = Patient.find_by(id: appointment_params[:patient_id])
    @appointment = @staff.appointment.build(appointment_params)
    if @appointment.save
      flash[:info] = "Patient member has been added"
      redirect_to root_url
    else
      @appointment.errors.full_messages
      render 'new'
    end
  end

  def index
    @appointments = Appointment.paginate(page: params[:page])
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  private

  def appointment_params
    params.require(:appointment).permit(:date, :staff_id, :patient_id, :price, :note)
  end
end