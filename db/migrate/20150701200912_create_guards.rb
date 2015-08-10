class CreateGuards < ActiveRecord::Migration
  def change
    create_table :guards do |t|
      t.string :guardia
    end
  end
end
