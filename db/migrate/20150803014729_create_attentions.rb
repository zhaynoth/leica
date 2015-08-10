class CreateAttentions < ActiveRecord::Migration
  def change
    create_table :attentions do |t|
      t.string :reportby
      t.datetime :dateinc
      t.datetime :datefin
      t.integer :type_id, index: true, foreign_key: true
      t.integer :horas
      t.integer :horashombre
      t.integer :contract_id, index: true, foreign_key: true

      t.timestamps
    end
  end
end
