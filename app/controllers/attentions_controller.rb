class AttentionsController < ApplicationController
  before_action :set_attention, only: [:show, :edit, :update, :destroy]
  before_action :set_status, only: [:index, :show]
  before_action :set_methods_for_form, only:[:index, :create]

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
    @projects = Project.all
    @attention = Attention.new(attention_params)
    @attention.participants = params[:participants]
    @attention.responsible = params[:responsible]

    respond_to do |format|
      if @attention.save
        format.html { redirect_to @attention, notice: 'Attention was successfully created.' }
        format.json { render :show, status: :created, location: @attention }
      else
        format.html { render :index }
        format.json { render json: @attention.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attentions/1
  # PATCH/PUT /attentions/1.json
  def update
    respond_to do |format|
      if @attention.update(attention_params)
        format.html { redirect_to @attention, notice: 'Attention was successfully updated.' }
        format.json { render :show, status: :ok, location: @attention }
      else
        format.html { render :edit }
        format.json { render json: @attention.errors, status: :unprocessable_entity }
      end
    end
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
    def set_status
      $status_types = Type.where(:campo => 'attentions_status')
    end
    def set_methods_for_form
      @attentions = Attention.all
      @attention = Attention.new
      @projects = Project.all
      @workers = Worker.all    
    end

end
