class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.string :nombre
      t.integer :project_id, index: true, foreign_key: true
	end
  end
end
