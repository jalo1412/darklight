class LectureCourseEntriesController < ApplicationController
  before_action :set_lecture_course_entry, only: [:show, :edit, :update, :destroy]
  before_action :set_lecture_course, only: [:new]
  # GET /lecture_course_entries
  # GET /lecture_course_entries.json
  def index
    @lecture_course_entries = LectureCourseEntry.all
  end

  # GET /lecture_course_entries/1
  # GET /lecture_course_entries/1.json
  def show
  end

  # GET /lecture_course_entries/new
  def new
    usuarioid = session[:user_id]
    @profe = Teacher.where(User_id: usuarioid)
    @lecture_course_entry = LectureCourseEntry.new
    @numberoflectures = LectureCourseEntry.where(Lecture_course_id: @lecture_course.id).count
  end

  def add
    @lecture_course_entry = LectureCourseEntry.new
  end
  # GET /lecture_course_entries/1/edit
  def edit
  end

  # POST /lecture_course_entries
  # POST /lecture_course_entries.json
  def create
    @lecture_course_entry = LectureCourseEntry.new(lecture_course_entry_params)

    respond_to do |format|
      if @lecture_course_entry.save
        format.html { redirect_to @lecture_course_entry, notice: 'Lecture course entry was successfully created.' }
        format.json { render :show, status: :created, location: @lecture_course_entry }
      else
        format.html { render :new }
        format.json { render json: @lecture_course_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lecture_course_entries/1
  # PATCH/PUT /lecture_course_entries/1.json
  def update
    respond_to do |format|
      if @lecture_course_entry.update(lecture_course_entry_params)
        format.html { redirect_to @lecture_course_entry, notice: 'Lecture course entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @lecture_course_entry }
      else
        format.html { render :edit }
        format.json { render json: @lecture_course_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lecture_course_entries/1
  # DELETE /lecture_course_entries/1.json
  def destroy
    @lecture_course_entry.destroy
    respond_to do |format|
      format.html { redirect_to lecture_course_entries_url, notice: 'Lecture course entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lecture_course_entry
      @lecture_course_entry = LectureCourseEntry.find(params[:id])
    end

    def set_lecture_course
      lecture_course_str = params[:lecture_course]
      @lecture_course = LectureCourse.find(lecture_course_str.to_i)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lecture_course_entry_params
      params.require(:lecture_course_entry).permit(:number, :date, :time, :description, :Lecture_course_id)
    end
end
