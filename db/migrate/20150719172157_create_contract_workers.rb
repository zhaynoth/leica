class CreateContractWorkers < ActiveRecord::Migration
  def change
    create_table :contract_workers do |t|
      t.references :contract, index: true
      t.references :worker, index: true
      t.string :estado

      t.timestamps
    end
    add_foreign_key(:contract_workers, :contracts, column: 'contract_id')
    add_foreign_key(:contract_workers, :workers, column: 'worker_id')
  end
end