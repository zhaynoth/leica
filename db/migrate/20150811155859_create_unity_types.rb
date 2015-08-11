class CreateUnityTypes < ActiveRecord::Migration
  def change
    create_table :unity_types do |t|
      t.string :type
      t.timestamps
    end
  end
end
