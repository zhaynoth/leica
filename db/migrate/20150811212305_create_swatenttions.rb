class CreateSwatenttions < ActiveRecord::Migration
  def change
    create_table :swatenttions do |t|
      t.text :issue
      t.integer :type_id, index: true
      t.integer :priority, index: true
      t.text :comment
      t.integer :unity_id, index: true
      t.belongs_to :attention, index: true

      t.timestamps
    end
    add_foreign_key(:swatenttions, :types, column: 'type_id')
    add_foreign_key(:swatenttions, :types, column: 'priority')
    add_foreign_key(:swatenttions, :attentions, column: 'attention_id')
    add_foreign_key(:swatenttions, :unities, column: 'unity_id')
  end
end
