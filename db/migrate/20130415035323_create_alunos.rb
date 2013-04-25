class CreateAlunos < ActiveRecord::Migration
  def change
    create_table :alunos do |t|
      t.string :Nome, :limit => 60
      t.string :Fone, :limit => 20
      t.date :Nascimento
      t.date :Batismo
      t.string :Email
      t.text :Endereco

      t.timestamps
    end
  end
end
