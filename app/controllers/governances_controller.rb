class GovernancesController < ApplicationController
  before_action :set_governance, only: [:show, :edit, :update, :destroy]

  # GET /governances
  # GET /governances.json
  def index
    @governances = Governance.all
    respond_to do |format|
      format.html
      format.json { send_data @governances.to_json, filename: "governance-#{Date.today}.json" }
      format.csv { send_data @governances.to_csv, filename: "governance-#{Date.today}.csv" }
    end
  end

  # GET /governances/1
  # GET /governances/1.json
  def show
  end

  # GET /governances/new
  def new
    @governance = Governance.new
  end

  # GET /governances/1/edit
  def edit
  end

  # POST /governances
  # POST /governances.json
  def create
    @governance = Governance.new(governance_params)

    respond_to do |format|
      if @governance.save
        format.html { redirect_to @governance, notice: 'Governance was successfully created.' }
        format.json { render :show, status: :created, location: @governance }
      else
        format.html { render :new }
        format.json { render json: @governance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /governances/1
  # PATCH/PUT /governances/1.json
  def update
    respond_to do |format|
      if @governance.update(governance_params)
        format.html { redirect_to @governance, notice: 'Governance was successfully updated.' }
        format.json { render :show, status: :ok, location: @governance }
      else
        format.html { render :edit }
        format.json { render json: @governance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /governances/1
  # DELETE /governances/1.json
  def destroy
    @governance.destroy
    respond_to do |format|
      format.html { redirect_to governances_url, notice: 'Governance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_governance
      @governance = Governance.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def governance_params
      params.require(:governance).permit(:name, :description, :notes, :slug)
    end
end
