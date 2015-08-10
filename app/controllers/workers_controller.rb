class WorkersController < ApplicationController
  before_action :set_worker, only: [:contract_add, :show, :edit, :update, :destroy]
  before_action :set_cargos, only: [:index, :show]
   
  # GET /workers
  # GET /workers.json
  def index
    @workers = Worker.all  
    @worker = Worker.new       
  end

  # GET /workers/1
  # GET /workers/1.json
  def show
    @unassigned_contracts = @worker.unassigned_contracts
    @contract_workers = @worker.contract_worker
    @projects = Project.all
  end

  # GET /workers/new
  def new
    @worker = Worker.new
  end

  # GET /workers/1/edit
  def edit
  end

  # POST /workers
  # POST /workers.json
  def create
    #variable para mostrar lsta de trabajadores después de crear uno 
    @workers = Worker.all 

    @worker = Worker.new(worker_params)
    respond_to do |format|    
      if @worker.save        
        format.html { redirect_to workers_path, notice: 'El registro se creó con éxito.' }
        format.json { render :show, status: :created, location: @worker }
        format.js
      else
        format.html { render :index }
        format.json { render json: @worker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workers/1
  # PATCH/PUT /workers/1.json   
  def update
    respond_to do |format|
      if @worker.update(worker_params)
        format.html { redirect_to @worker, notice: 'El registro se actualizó con éxito.' }
        format.json { render :show, status: :ok, location: @worker }
      else
        format.html { render :edit }
        format.json { render json: @worker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workers/1
  # DELETE /workers/1.json
  def destroy
    @worker.destroy
    respond_to do |format|
      format.html { redirect_to workers_url, notice: 'Worker was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

# ---------------START EXTRA METHODS----------------

  # POST /worker/1/contract_add?contract_id=2
  # takes a worker_id and a single contract_id and adds the worker to that contract
  def contract_add
    #Convert ids from routing to objects
    @contract = Contract.find(params[:contract])
    # raise params.to_yaml
    respond_to do |format|
      if not @worker.assigned_in?(@contract) 
        #add contract to list using << operator  
        @worker.contract << @contract

        #flash[:notice] = 'El trabajador fue asignado con éxito' 
        @project = @contract.project 
        @contract_worker = @worker.contract_worker.last
        @flag = {:msaje => "asigneed"}

        format.html { redirect_to @worker }
        format.json { render :show, status: :ok, location: @worker }
      else
        @flag = {:msaje => "no-asigneed"}
        #flash[:notice] = 'El trabajador ya ha sido asignado a este contrato'
        format.html { redirect_to @worker }
        #format.json { render json: @worker.errors, status: :unprocessable_entity }
        format.json { render :econtracts, status: :ok, location: @flag }
      end
    end      
  end
  
  # POST /workers/:id/contract_remove(.:format)
  def contract_remove
    @contract_worker = ContractWorker.find(params[:id])
     #raise params.to_yaml
    @worker = @contract_worker.worker    
    @rowid = @contract_worker.id
    if @contract_worker != nil    
      @contract_worker.destroy
      respond_to do |format|
        @flag = {:msaje => @rowid}
        format.html { redirect_to @worker }
        format.json { render :econtracts, status: :ok, location: @worker }
      end
    end
  end

  def contract_removes
    @contract_worker = ContractWorker.where(:contract_id => contract.id, :worker_id =>worker.id ) 
    @contract_worker.destroy
    respond_to do |cw|
      format.html { redirect_to @worker, notice: 'El registro se actualizó con éxito.' }
      format.json { render :show, status: :ok, location: @worker }
    end

    #Convert ids from routing to object
    @worker = worker.find(params [:id])

    #get list of contracts to remove from query string
    contract_ids = params[:contracts]

    unless contract_ids.blank?
      contract_ids.each do |contract_id|
        contract = Contract.find(contract_id)
        if @worker.assigned_in?(contract)
          logger.info "Trabajdor removido del contrato #{contract.id}" 
          @worker.contracts.DELETE(contract)
          flash[:notice] = 'contrato removido con éxito'         
        end
      end
    end

    format.html{ redirect_to :action => :contracts, :id => @worker}
  end

# ---------------END EXTRA METHODS----------------



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_worker
      @worker = Worker.find(params[:id])
    end

    #llena lostipos de cargo para un nuevo trabajador
    def set_cargos
      $cargo_types = Type.where(:campo => 'workers_cargo')
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def worker_params
      params.require(:worker).permit(:nombre, :apellido, :type_id, :fotocheck, :telefono, :email)
    end

end