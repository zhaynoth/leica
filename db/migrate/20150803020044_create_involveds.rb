class CreateInvolveds < ActiveRecord::Migration
  def change
    create_table :involveds do |t|
      t.references :worker, index: true
      t.references :attention, index: true
      t.string :rol

      t.timestamps
    end
    add_foreign_key(:involveds, :workers, column: 'worker_id')
    add_foreign_key(:involveds, :attentions, column: 'attention_id')
  end
end
