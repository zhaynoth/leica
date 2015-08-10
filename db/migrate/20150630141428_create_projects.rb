class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :nombre
      t.string :ubicacion
    end
  end
end
