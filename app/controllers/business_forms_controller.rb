class BusinessFormsController < ApplicationController
  before_action :set_business_form, only: [:show, :edit, :update, :destroy]

  # GET /business_forms
  # GET /business_forms.json
  def index
    @business_forms = BusinessForm.all
    respond_to do |format|
      format.html
      format.json { send_data BusinessForm.dump_to_json(@business_forms), filename: "business_forms-#{Time.now.strftime('%Y-%m-%d_%H-%M')}.json" }
      format.csv { send_data BusinessForm.dump_to_csv(@business_forms), filename: "business_forms-#{Time.now.strftime('%Y-%m-%d_%H-%M')}.csv" }
    end
  end

  # GET /business_forms/1
  # GET /business_forms/1.json
  def show
  end

  # GET /business_forms/new
  def new
    @business_form = BusinessForm.new
  end

  # GET /business_forms/1/edit
  def edit
  end

  # POST /business_forms
  # POST /business_forms.json
  def create
    @business_form = BusinessForm.new(business_form_params)

    respond_to do |format|
      if @business_form.save
        format.html { redirect_to @business_form, notice: 'Business form was successfully created.' }
        format.json { render :show, status: :created, location: @business_form }
      else
        format.html { render :new }
        format.json { render json: @business_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /business_forms/1
  # PATCH/PUT /business_forms/1.json
  def update
    respond_to do |format|
      if @business_form.update(business_form_params)
        format.html { redirect_to @business_form, notice: 'Business form was successfully updated.' }
        format.json { render :show, status: :ok, location: @business_form }
      else
        format.html { render :edit }
        format.json { render json: @business_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /business_forms/1
  # DELETE /business_forms/1.json
  def destroy
    @business_form.destroy
    respond_to do |format|
      format.html { redirect_to business_forms_url, notice: 'Business form was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_business_form
      @business_form = BusinessForm.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def business_form_params
      params.require(:business_form).permit(:name, :description, :slug, :notes, :editorial)
    end
end
