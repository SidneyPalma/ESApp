class CreateTrimestres < ActiveRecord::Migration
  def change
    create_table :trimestres do |t|
      t.string :trimestre, :limit => 5
      t.integer :ano, :limit => 4
      t.integer :trim, :limit => 1
      t.integer :qtde_sabados, :limit => 2

      t.timestamps
    end
  end
end
