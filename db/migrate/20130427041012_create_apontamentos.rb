class CreateApontamentos < ActiveRecord::Migration
  def change
    create_table :apontamentos do |t|
      t.integer :trimestre_id
      t.integer :unidade_id
      t.integer :aluno_id
      t.boolean :sab01
      t.boolean :sab02
      t.boolean :sab03
      t.boolean :sab04
      t.boolean :sab05
      t.boolean :sab06
      t.boolean :sab07
      t.boolean :sab08
      t.boolean :sab09
      t.boolean :sab10
      t.boolean :sab11
      t.boolean :sab12
      t.boolean :sab13
      t.boolean :sab14

      t.timestamps
    end
  end
end
