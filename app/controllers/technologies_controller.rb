class TechnologiesController < ApplicationController
  before_action :set_technology, only: [:show, :edit, :update, :destroy]

  # GET /technologies
  # GET /technologies.json
  def index
    @technologies = Technology.includes(:adoption_level).includes(:readiness_level).includes(:status).includes(:governance).includes(:business_form).published
    respond_to do |format|
      format.html
      format.json { send_data Technology.dump_to_json(@technologies), filename: "technologies-#{Time.now.strftime('%Y-%m-%d_%H-%M')}.json" }
      format.csv { send_data Technology.dump_to_csv(@technologies), filename: "technologies-#{Time.now.strftime('%Y-%m-%d_%H-%M')}.csv" }
    end
  end

  # GET /technologies/1
  # GET /technologies/1.json
  def show
  end

  # GET /technologies/new
  def new
    @technology = Technology.new
  end

  # GET /technologies/1/edit
  def edit
    #@adoption_levels = AdoptionLevel.all
  end

  # POST /technologies
  # POST /technologies.json
  def create
    @technology = Technology.new(technology_params)

    respond_to do |format|
      if @technology.save
        format.html { redirect_to @technology, notice: 'Technology was successfully created.' }
        format.json { render :show, status: :created, location: @technology }
      else
        format.html { render :new }
        format.json { render json: @technology.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /technologies/1
  # PATCH/PUT /technologies/1.json
  def update
    respond_to do |format|
      if @technology.update(technology_params)
        format.html { redirect_to @technology, notice: 'Technology was successfully updated.' }
        format.json { render :show, status: :ok, location: @technology }
      else
        format.html { render :edit }
        format.json { render json: @technology.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /technologies/1
  # DELETE /technologies/1.json
  def destroy
    @technology.destroy
    respond_to do |format|
      format.html { redirect_to technologies_url, notice: 'Technology was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_technology
    @technology = Technology.includes(:adoption_level).includes(:readiness_level).includes(:governance).includes(:business_form).includes(:status).includes(:categories).includes(:functions).includes(:collections).friendly.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def technology_params
    params.require(:technology).permit(:slug, :name, :description, :url, :codebase, :roadmap, :hosting, :pricing, :licensing, :notes, :editorial, :adoption_level_id, :readiness_level_id, :governance_id, :business_form_id, :editorial_state_id,:status_id, :tag_list, :base_tech_list, :function_ids => [], :category_ids => [], :collection_ids => [],:dependee_ids => [])
  end
end
