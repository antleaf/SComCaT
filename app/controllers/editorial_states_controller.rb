class EditorialStatesController < ApplicationController
  before_action :set_editorial_state, only: [:show, :edit, :update, :destroy]

  # GET /editorial_states
  # GET /editorial_states.json
  def index
    @editorial_states = EditorialState.all
  end

  # GET /editorial_states/1
  # GET /editorial_states/1.json
  def show
  end

  # GET /editorial_states/new
  def new
    @editorial_state = EditorialState.new
  end

  # GET /editorial_states/1/edit
  def edit
  end

  # POST /editorial_states
  # POST /editorial_states.json
  def create
    @editorial_state = EditorialState.new(editorial_state_params)

    respond_to do |format|
      if @editorial_state.save
        format.html { redirect_to @editorial_state, notice: 'Editorial state was successfully created.' }
        format.json { render :show, status: :created, location: @editorial_state }
      else
        format.html { render :new }
        format.json { render json: @editorial_state.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /editorial_states/1
  # PATCH/PUT /editorial_states/1.json
  def update
    respond_to do |format|
      if @editorial_state.update(editorial_state_params)
        format.html { redirect_to @editorial_state, notice: 'Editorial state was successfully updated.' }
        format.json { render :show, status: :ok, location: @editorial_state }
      else
        format.html { render :edit }
        format.json { render json: @editorial_state.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /editorial_states/1
  # DELETE /editorial_states/1.json
  def destroy
    @editorial_state.destroy
    respond_to do |format|
      format.html { redirect_to editorial_states_url, notice: 'Editorial state was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_editorial_state
      @editorial_state = EditorialState.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def editorial_state_params
      params.require(:editorial_state).permit(:name, :description)
    end
end
