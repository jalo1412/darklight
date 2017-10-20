class StatusOfAttendancesController < ApplicationController
  before_action :set_status_of_attendance, only: [:show, :edit, :update, :destroy]

  # GET /status_of_attendances
  # GET /status_of_attendances.json
  def index
    @status_of_attendances = StatusOfAttendance.all
  end

  # GET /status_of_attendances/1
  # GET /status_of_attendances/1.json
  def show
  end

  # GET /status_of_attendances/new
  def new
    @status_of_attendance = StatusOfAttendance.new
  end

  # GET /status_of_attendances/1/edit
  def edit
  end

  # POST /status_of_attendances
  # POST /status_of_attendances.json
  def create
    @status_of_attendance = StatusOfAttendance.new(status_of_attendance_params)

    respond_to do |format|
      if @status_of_attendance.save
        format.html { redirect_to @status_of_attendance, notice: 'Status of attendance was successfully created.' }
        format.json { render :show, status: :created, location: @status_of_attendance }
      else
        format.html { render :new }
        format.json { render json: @status_of_attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /status_of_attendances/1
  # PATCH/PUT /status_of_attendances/1.json
  def update
    respond_to do |format|
      if @status_of_attendance.update(status_of_attendance_params)
        format.html { redirect_to @status_of_attendance, notice: 'Status of attendance was successfully updated.' }
        format.json { render :show, status: :ok, location: @status_of_attendance }
      else
        format.html { render :edit }
        format.json { render json: @status_of_attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /status_of_attendances/1
  # DELETE /status_of_attendances/1.json
  def destroy
    @status_of_attendance.destroy
    respond_to do |format|
      format.html { redirect_to status_of_attendances_url, notice: 'Status of attendance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_status_of_attendance
      @status_of_attendance = StatusOfAttendance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def status_of_attendance_params
      params.require(:status_of_attendance).permit(:status)
    end
end
