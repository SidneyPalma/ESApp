class DeleteTableclasses < ActiveRecord::Migration
  def up
    drop_table :classes
    drop_table :unidadeacaos
  end

  def down
  end
end
