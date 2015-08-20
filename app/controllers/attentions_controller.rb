class AttentionsController < ApplicationController
  # before_action :set_attention, only: [:show, :edit, :update, :destroy]
  before_action :set_methods_for_reports, only:[:index, :create]
  helper_method :get_responsible, :get_type_valor
  # GET /attentions
  # GET /attentions.json
  def index
  end

  # GET /attentions/1
  # GET /attentions/1.json
  def show
  end

  # GET /attentions/new
  def new
  end

  # GET /attentions/1/edit
  def edit
  end

  # POST /attentions
  # POST /attentions.json
  def create
    # @attention = Attention.new(attention_params)
    # @attention.participants = params[:participants]
    # @attention.responsible = params[:responsible]
    # @attention.nro_involved =  params[:participants].count + 1

    # respond_to do |format|
    #   if @attention.save
    #     format.html { redirect_to @attention, notice: 'Attention was successfully created.' }
    #     format.json { render :show, status: :created, location: @attention }
    #   else
    #     format.html { render :index }
    #     format.json { render json: @attention.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /attentions/1
  # PATCH/PUT /attentions/1.json
  def update
    # respond_to do |format|
    #   if @attention.update(attention_params)
    #     format.html { redirect_to @attention, notice: 'Attention was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @attention }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @attention.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /attentions/1
  # DELETE /attentions/1.json
   def destroy
    @attention.destroy
    respond_to do |format|
      format.html { redirect_to attentions_url, notice: 'Attention was successfully destroyed.' }
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
  def close_report
    @send_attentions = Attention.where(:report => 'send')
    respond_to do |format|
      @send_attentions.update_all(report: "close")
      format.html { redirect_to attentions_url, notice: 'Reporte cerrado con éxito.' }
      format.json { head :no_content }
    end      
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attention
      @attention = Attention.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attention_params 
      params.require(:attention).permit(:reportby, :dateinc, :datefin, :type_id, :contract_id, :participants, :responsible)
    end

  # EXTRA PRIVATE METHODS
  def set_methods_for_reports
    #flag to set report close
    @flag_att = Attention.new
    @send_attentions = Attention.where(:report => 'send')
    @close_attentions = Attention.where(:report => 'close')
  end

end
