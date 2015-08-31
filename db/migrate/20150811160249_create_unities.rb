class CreateUnities < ActiveRecord::Migration
  def change
    create_table :unities do |t|
      t.string :unity
      t.integer :unity_subtype_id, index: true
      t.integer :project_id, index: true

      t.timestamps
    end
     add_foreign_key(:unities, :unity_subtypes, column: 'unity_subtype_id')
     add_foreign_key(:unities, :projects, column: 'project_id')
  end
end
