class CreateAttentions < ActiveRecord::Migration
  def change
    create_table :attentions do |t|
      t.string :reportby
      t.datetime :dateinc
      t.datetime :datefin
      t.integer :type_id, index: true
      t.float :horas, precision: 2, scale: 2
      t.float :horashombre, precision: 2, scale: 2
      t.integer :contract_id, index: true
      t.string :report
      t.belongs_to :user, index: true

      t.timestamps
    end
    add_foreign_key(:attentions, :types, column: 'type_id')
    add_foreign_key(:attentions, :contracts, column: 'contract_id')
    add_foreign_key(:attentions, :users, column: 'user_id')
    
  end
end
