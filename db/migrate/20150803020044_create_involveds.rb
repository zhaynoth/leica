class CreateInvolveds < ActiveRecord::Migration
  def change
    create_table :involveds do |t|
      t.references :worker, index: true
      t.references :attention, index: true
      t.string :rol

      t.timestamps
    end
  end
end
