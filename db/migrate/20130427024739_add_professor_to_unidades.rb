class AddProfessorToUnidades < ActiveRecord::Migration
  def change
    add_column :unidades, :professor, :string, :limit => 60
    add_column :unidades, :associado, :string, :limit => 60
    add_column :unidades, :secretario, :string, :limit => 60
  end
end
