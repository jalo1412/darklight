class TypeOfEvaluationsController < ApplicationController
  before_action :set_type_of_evaluation, only: [:show, :edit, :update, :destroy]

  # GET /type_of_evaluations
  # GET /type_of_evaluations.json
  def index
    @type_of_evaluations = TypeOfEvaluation.all
  end

  # GET /type_of_evaluations/1
  # GET /type_of_evaluations/1.json
  def show
  end

  # GET /type_of_evaluations/new
  def new
    @type_of_evaluation = TypeOfEvaluation.new
  end

  # GET /type_of_evaluations/1/edit
  def edit
  end

  # POST /type_of_evaluations
  # POST /type_of_evaluations.json
  def create
    @type_of_evaluation = TypeOfEvaluation.new(type_of_evaluation_params)

    respond_to do |format|
      if @type_of_evaluation.save
        format.html { redirect_to @type_of_evaluation, notice: 'Type of evaluation was successfully created.' }
        format.json { render :show, status: :created, location: @type_of_evaluation }
      else
        format.html { render :new }
        format.json { render json: @type_of_evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /type_of_evaluations/1
  # PATCH/PUT /type_of_evaluations/1.json
  def update
    respond_to do |format|
      if @type_of_evaluation.update(type_of_evaluation_params)
        format.html { redirect_to @type_of_evaluation, notice: 'Type of evaluation was successfully updated.' }
        format.json { render :show, status: :ok, location: @type_of_evaluation }
      else
        format.html { render :edit }
        format.json { render json: @type_of_evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /type_of_evaluations/1
  # DELETE /type_of_evaluations/1.json
  def destroy
    @type_of_evaluation.destroy
    respond_to do |format|
      format.html { redirect_to type_of_evaluations_url, notice: 'Type of evaluation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_of_evaluation
      @type_of_evaluation = TypeOfEvaluation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def type_of_evaluation_params
      params.require(:type_of_evaluation).permit(:name, :weight)
    end
end
