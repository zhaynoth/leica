class CreateTypes < ActiveRecord::Migration
  def change
    create_table :types do |t|
      t.string :campo
      t.string :valor
    end
  end
end
