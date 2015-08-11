class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.string :nombre
      t.integer :project_id, index: true
	end
	 add_foreign_key(:contracts, :projects, column: 'project_id')
  end
end
