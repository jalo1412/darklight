class TypeOfUsersController < ApplicationController
  before_action :set_type_of_user, only: [:show, :edit, :update, :destroy]

  # GET /type_of_users
  # GET /type_of_users.json
  def index
    @type_of_users = TypeOfUser.all
  end

  # GET /type_of_users/1
  # GET /type_of_users/1.json
  def show
  end

  # GET /type_of_users/new
  def new
    @type_of_user = TypeOfUser.new
  end

  # GET /type_of_users/1/edit
  def edit
  end

  # POST /type_of_users
  # POST /type_of_users.json
  def create
    @type_of_user = TypeOfUser.new(type_of_user_params)

    respond_to do |format|
      if @type_of_user.save
        format.html { redirect_to @type_of_user, notice: 'Type of user was successfully created.' }
        format.json { render :show, status: :created, location: @type_of_user }
      else
        format.html { render :new }
        format.json { render json: @type_of_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /type_of_users/1
  # PATCH/PUT /type_of_users/1.json
  def update
    respond_to do |format|
      if @type_of_user.update(type_of_user_params)
        format.html { redirect_to @type_of_user, notice: 'Type of user was successfully updated.' }
        format.json { render :show, status: :ok, location: @type_of_user }
      else
        format.html { render :edit }
        format.json { render json: @type_of_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /type_of_users/1
  # DELETE /type_of_users/1.json
  def destroy
    @type_of_user.destroy
    respond_to do |format|
      format.html { redirect_to type_of_users_url, notice: 'Type of user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_of_user
      @type_of_user = TypeOfUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def type_of_user_params
      params.require(:type_of_user).permit(:type_of_user)
    end
end
