class UnitySubtypesController < ApplicationController
  before_action :set_unity_subtype, only: [:show, :edit, :update, :destroy]

  # GET /unity_subtypes
  # GET /unity_subtypes.json
  def index
    @unity_subtypes = UnitySubtype.all
  end

  # GET /unity_subtypes/1
  # GET /unity_subtypes/1.json
  def show
  end

  # GET /unity_subtypes/new
  def new
    @unity_subtype = UnitySubtype.new
  end

  # GET /unity_subtypes/1/edit
  def edit
  end

  # POST /unity_subtypes
  # POST /unity_subtypes.json
  def create
    @unity_subtype = UnitySubtype.new(unity_subtype_params)

    respond_to do |format|
      if @unity_subtype.save
        format.html { redirect_to @unity_subtype, notice: 'Unity subtype was successfully created.' }
        format.json { render :show, status: :created, location: @unity_subtype }
      else
        format.html { render :new }
        format.json { render json: @unity_subtype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /unity_subtypes/1
  # PATCH/PUT /unity_subtypes/1.json
  def update
    respond_to do |format|
      if @unity_subtype.update(unity_subtype_params)
        format.html { redirect_to @unity_subtype, notice: 'Unity subtype was successfully updated.' }
        format.json { render :show, status: :ok, location: @unity_subtype }
      else
        format.html { render :edit }
        format.json { render json: @unity_subtype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /unity_subtypes/1
  # DELETE /unity_subtypes/1.json
  def destroy
    @unity_subtype.destroy
    respond_to do |format|
      format.html { redirect_to unity_subtypes_url, notice: 'Unity subtype was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unity_subtype
      @unity_subtype = UnitySubtype.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def unity_subtype_params
      params.require(:unity_subtype).permit(:subtype, :unity_type_id)
    end
end
