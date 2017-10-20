class LectureCoursesController < ApplicationController
  before_action :set_lecture_course, only: [:show, :edit, :update, :destroy]

  # GET /lecture_courses
  # GET /lecture_courses.json
  def index
    @lecture_courses = LectureCourse.all
  end

  # GET /lecture_courses/1
  # GET /lecture_courses/1.json
  def show
  end

  # GET /lecture_courses/new
  def new
    @lecture_course = LectureCourse.new
  end

  # GET /lecture_courses/1/edit
  def edit
  end

  # POST /lecture_courses
  # POST /lecture_courses.json
  def create
    @lecture_course = LectureCourse.new(lecture_course_params)

    respond_to do |format|
      if @lecture_course.save
        format.html { redirect_to @lecture_course, notice: 'Lecture course was successfully created.' }
        format.json { render :show, status: :created, location: @lecture_course }
      else
        format.html { render :new }
        format.json { render json: @lecture_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lecture_courses/1
  # PATCH/PUT /lecture_courses/1.json
  def update
    respond_to do |format|
      if @lecture_course.update(lecture_course_params)
        format.html { redirect_to @lecture_course, notice: 'Lecture course was successfully updated.' }
        format.json { render :show, status: :ok, location: @lecture_course }
      else
        format.html { render :edit }
        format.json { render json: @lecture_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lecture_courses/1
  # DELETE /lecture_courses/1.json
  def destroy
    @lecture_course.destroy
    respond_to do |format|
      format.html { redirect_to lecture_courses_url, notice: 'Lecture course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lecture_course
      @lecture_course = LectureCourse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lecture_course_params
      params.require(:lecture_course).permit(:Course_id, :Lecture_id)
    end
end
