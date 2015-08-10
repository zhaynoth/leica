class CreateWorkers < ActiveRecord::Migration
  def change
    create_table :workers do |t|
      t.string :nombre
      t.string :apellido
      t.integer :type_id
      t.string :fotocheck
      t.string :telefono
      t.string :email
      t.timestamps
    end
  end
end
