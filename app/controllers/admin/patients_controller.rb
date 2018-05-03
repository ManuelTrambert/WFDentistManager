class Admin::PatientsController < AdminController

  def edit
    @patient = Patient.find(params[:id])
  end

  def update
    @patient = Patient.find(params[:id])
    if @patient.update_attributes(patient_params)
      flash[:success] = "Profile updated"
      redirect_to root_url
    else
      render 'edit'
    end
  end

  def new
    @patient = Patient.new
  end

  def create
    @user = User.find_by(id: patient_params[:user_id])
    @patient = @user.patient.build(patient_params)
    if @patient.save
      flash[:info] = "Patient member has been added"
      redirect_to root_url
    else
      @patient.errors.full_messages
      render 'new'
    end
  end

  def index
    @patients = Patient.paginate(page: params[:page])
  end

  def show
    @patient = Patient.find(params[:id])
  end

  private

  def patient_params
    params.require(:patient).permit(:allergies, :user_id, :phoneNumber, :note)
  end
end