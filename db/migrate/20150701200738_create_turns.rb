class CreateTurns < ActiveRecord::Migration
  def change
    create_table :turns do |t|
      t.string :turno
    end
  end
end
