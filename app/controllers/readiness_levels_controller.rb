class ReadinessLevelsController < ApplicationController
  before_action :set_readiness_level, only: [:show, :edit, :update, :destroy]

  # GET /readiness_levels
  # GET /readiness_levels.json
  def index
    @readiness_levels = ReadinessLevel.all
  end

  # GET /readiness_levels/1
  # GET /readiness_levels/1.json
  def show
  end

  # GET /readiness_levels/new
  def new
    @readiness_level = ReadinessLevel.new
  end

  # GET /readiness_levels/1/edit
  def edit
  end

  # POST /readiness_levels
  # POST /readiness_levels.json
  def create
    @readiness_level = ReadinessLevel.new(readiness_level_params)

    respond_to do |format|
      if @readiness_level.save
        format.html { redirect_to @readiness_level, notice: 'Readiness level was successfully created.' }
        format.json { render :show, status: :created, location: @readiness_level }
      else
        format.html { render :new }
        format.json { render json: @readiness_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /readiness_levels/1
  # PATCH/PUT /readiness_levels/1.json
  def update
    respond_to do |format|
      if @readiness_level.update(readiness_level_params)
        format.html { redirect_to @readiness_level, notice: 'Readiness level was successfully updated.' }
        format.json { render :show, status: :ok, location: @readiness_level }
      else
        format.html { render :edit }
        format.json { render json: @readiness_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /readiness_levels/1
  # DELETE /readiness_levels/1.json
  def destroy
    @readiness_level.destroy
    respond_to do |format|
      format.html { redirect_to readiness_levels_url, notice: 'Readiness level was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_readiness_level
      @readiness_level = ReadinessLevel.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def readiness_level_params
      params.require(:readiness_level).permit(:name, :description, :notes)
    end
end
