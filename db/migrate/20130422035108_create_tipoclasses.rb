class CreateTipoclasses < ActiveRecord::Migration
  def change
    create_table :tipoclasses do |t|
      t.string :sigla, :limit => 5
      t.string :descricao, :limit => 30
      t.integer :idadede
      t.integer :idadeate

      t.timestamps
    end
  end
end
