class SwatenttionsController < ApplicationController
  before_action :set_swatenttion, only: [:show, :edit, :update, :destroy]
  before_action :set_methods_for_form, only:[:index, :create]
  helper_method :get_responsible, :get_type_valor

  # GET /swatenttions
  # GET /swatenttions.json
  def index
  end

  # GET /swatenttions/1
  # GET /swatenttions/1.json
  def show
  end

  # GET /swatenttions/new
  def new
    @swatenttion = Swatenttion.new
  end

  # GET /swatenttions/1/edit
  def edit
  end

  # POST /swatenttions
  # POST /swatenttions.json
  def create

    @attention = Attention.new(attention_params)
    # #set worker_id to create involved record with "responsable" rol    
    @attention.responsible = params[:attention][:responsible]
    #cout worker_id's to calculate men-hours and create involved records with "paticipante" rol   
    if params[:attention][:participants] != nil
      @attention.participants = params[:attention][:participants]
      cant =  params[:attention][:participants].count + 1
    else
      cant = 1
    end
    @attention.nro_involved = cant
 
      if @attention.save
        #----start save attention---
        @attention_sv = @attention.attention_saved
        @swatenttion = Swatenttion.new(swatenttion_params)
        @swatenttion.set_attention_id = @attention_sv.id
        respond_to do |format|
          if @swatenttion.save
            format.html { redirect_to @swatenttion, notice: 'Swatenttion was successfully created.' }
            format.json { render :show, status: :created, location: @swatenttion }
          else
            format.html { render :new }
            format.json { render json: @swatenttion.errors, status: :unprocessable_entity }
          end
        end
        #----end save attention---
      else
        respond_to do |format|
          format.html { redirect_to @swatenttion, notice: 'attention record no inserted' }
        end
      end
  end

  # PATCH/PUT /swatenttions/1
  # PATCH/PUT /swatenttions/1.json
  def update
    respond_to do |format|
      if @swatenttion.update(swatenttion_params)
        format.html { redirect_to @swatenttion, notice: 'Swatenttion was successfully updated.' }
        format.json { render :show, status: :ok, location: @swatenttion }
      else
        format.html { render :edit }
        format.json { render json: @swatenttion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /swatenttions/1
  # DELETE /swatenttions/1.json
  def destroy
    @swatenttion.destroy
    respond_to do |format|
      format.html { redirect_to swatenttions_url, notice: 'Swatenttion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  # EXTRA METHODS
  # this method extract a responsible worker record  from a given attention´s involved list
  def get_responsible (inv)
    @invol = inv
    @invol.each do |i|
      if i.rol == 'responsable' 
        @resp_worker_id = i.worker_id
      end
    end
    @resp_worker = Worker.find(@resp_worker_id)      
  end

  def get_type_valor (typ_id)
    @type_valor = Type.find(typ_id)
    @type_valor.valor
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_swatenttion
      @swatenttion = Swatenttion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def swatenttion_params
      params.require(:swatenttion).permit(:issue, :type_id, :priority, :comment, :unity_id, :attention_id)      
    end

    # Params for attention table and involved table
    def attention_params 
      params.require(:attention).permit(:reportby, :dateinc, :datefin, :type_id, :contract_id, :responsible, :participants)
    end

    # EXTRA PRIVATE METHODS
    def set_methods_for_form 
      @swatenttions = Swatenttion.all
      @swatenttion = Swatenttion.new    
      @projects = Project.all
      @workers = Worker.all  

      $status = Type.where(:campo => 'attentions_status')
      $swtype = Type.where(:campo => 'swattentions_type')
      $priority = Type.where(:campo => 'swattentions_priority')
      $equipment = Unity.all
    end

end