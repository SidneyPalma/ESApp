class AddUnidadeIdToAlunos < ActiveRecord::Migration
  def change
    add_column :alunos, :unidade_id, :integer
  end
end
