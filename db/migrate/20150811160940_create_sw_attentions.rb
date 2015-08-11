class CreateSwAttentions < ActiveRecord::Migration
  def change
    create_table :sw_attentions do |t|
      t.text :issue
      t.integer :type_id, index: true
      t.integer :priority_id, index: true
      t.text :comment
      t.integer :unity_id, index: true

      t.timestamps
    end
     add_foreign_key(:sw_attentions, :types, column: 'type_id')
     add_foreign_key(:sw_attentions, :types, column: 'priority_id')
     add_foreign_key(:sw_attentions, :unities, column: 'unity_id')
  end
end
