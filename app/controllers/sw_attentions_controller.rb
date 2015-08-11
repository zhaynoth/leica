class SwAttentionsController < ApplicationController
  before_action :set_sw_attention, only: [:show, :edit, :update, :destroy]

  # GET /attention_sws
  # GET /attention_sws.json
  def index
    @attention_sws = AttentionSw.all
  end

  # GET /attention_sws/1
  # GET /attention_sws/1.json
  def show
  end

  # GET /attention_sws/new
  def new
    @attention_sw = AttentionSw.new
  end

  # GET /attention_sws/1/edit
  def edit
  end

  # POST /attention_sws
  # POST /attention_sws.json
  def create
    @attention_sw = AttentionSw.new(attention_sw_params)

    respond_to do |format|
      if @attention_sw.save
        format.html { redirect_to @attention_sw, notice: 'Attention sw was successfully created.' }
        format.json { render :show, status: :created, location: @attention_sw }
      else
        format.html { render :new }
        format.json { render json: @attention_sw.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attention_sws/1
  # PATCH/PUT /attention_sws/1.json
  def update
    respond_to do |format|
      if @attention_sw.update(attention_sw_params)
        format.html { redirect_to @attention_sw, notice: 'Attention sw was successfully updated.' }
        format.json { render :show, status: :ok, location: @attention_sw }
      else
        format.html { render :edit }
        format.json { render json: @attention_sw.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attention_sws/1
  # DELETE /attention_sws/1.json
  def destroy
    @attention_sw.destroy
    respond_to do |format|
      format.html { redirect_to attention_sws_url, notice: 'Attention sw was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sw_attention
      @attention_sw = AttentionSw.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attention_sw_params
      params.require(:attention_sw).permit(:issue, :type, :priority, :integer, :comment, :unity_id)
    end
end
