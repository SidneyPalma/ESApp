class AddAtivoToTrimestres < ActiveRecord::Migration
  def change
    add_column :trimestres, :ativo, :boolean
  end
end
