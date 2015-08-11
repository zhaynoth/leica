class CreateUnitySubtypes < ActiveRecord::Migration
  def change
    create_table :unity_subtypes do |t|
      t.string :subtype
      t.integer :unity_types_id, index: true

      t.timestamps
    end
    add_foreign_key(:unity_subtypes, :unity_types, column: 'unity_types_id')
  end
end
