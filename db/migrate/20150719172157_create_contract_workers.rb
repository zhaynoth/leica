class CreateContractWorkers < ActiveRecord::Migration
  def change
    create_table :contract_workers do |t|
      t.references :contract, index: true
      t.references :worker, index: true
      t.string :estado

      t.timestamps
    end
  end
end