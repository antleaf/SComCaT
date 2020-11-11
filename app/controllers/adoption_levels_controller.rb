class AdoptionLevelsController < ApplicationController
  before_action :set_adoption_level, only: [:show, :edit, :update, :destroy]

  # GET /adoption_levels
  # GET /adoption_levels.json
  def index
    @adoption_levels = AdoptionLevel.all
    respond_to do |format|
      format.html
      format.json { send_data AdoptionLevel.dump_to_json(@adoption_levels), filename: "adoption_levels-#{Time.now.strftime('%Y-%m-%d_%H-%M')}.json" }
      format.csv { send_data AdoptionLevel.dump_to_csv(@adoption_levels), filename: "adoption_levels-#{Time.now.strftime('%Y-%m-%d_%H-%M')}.csv" }
    end
  end

  # GET /adoption_levels/1
  # GET /adoption_levels/1.json
  def show
  end

  # GET /adoption_levels/new
  def new
    @adoption_level = AdoptionLevel.new
  end

  # GET /adoption_levels/1/edit
  def edit
  end

  # POST /adoption_levels
  # POST /adoption_levels.json
  def create
    @adoption_level = AdoptionLevel.new(adoption_level_params)

    respond_to do |format|
      if @adoption_level.save
        format.html { redirect_to @adoption_level, notice: 'Adoption level was successfully created.' }
        format.json { render :show, status: :created, location: @adoption_level }
      else
        format.html { render :new }
        format.json { render json: @adoption_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /adoption_levels/1
  # PATCH/PUT /adoption_levels/1.json
  def update
    respond_to do |format|
      if @adoption_level.update(adoption_level_params)
        format.html { redirect_to @adoption_level, notice: 'Adoption level was successfully updated.' }
        format.json { render :show, status: :ok, location: @adoption_level }
      else
        format.html { render :edit }
        format.json { render json: @adoption_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adoption_levels/1
  # DELETE /adoption_levels/1.json
  def destroy
    @adoption_level.destroy
    respond_to do |format|
      format.html { redirect_to adoption_levels_url, notice: 'Adoption level was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_adoption_level
      @adoption_level = AdoptionLevel.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def adoption_level_params
      params.require(:adoption_level).permit(:name, :description, :notes, :editorial)
    end
end
