class CreateUnidades < ActiveRecord::Migration
  def change
    create_table :unidades do |t|
      t.string :nome
      t.integer :tipoclasse_id

      t.timestamps
    end
  end
end
