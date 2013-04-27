class CreateResposta < ActiveRecord::Migration
  def change
    create_table :resposta do |t|
      t.integer :trimestre_id
      t.integer :unidade_id
      t.integer :pergunta_id
      t.integer :sab01, :limit => 4
      t.integer :sab02, :limit => 4
      t.integer :sab03, :limit => 4
      t.integer :sab04, :limit => 4
      t.integer :sab05, :limit => 4
      t.integer :sab06, :limit => 4
      t.integer :sab07, :limit => 4
      t.integer :sab08, :limit => 4
      t.integer :sab09, :limit => 4
      t.integer :sab10, :limit => 4
      t.integer :sab11, :limit => 4
      t.integer :sab12, :limit => 4
      t.integer :sab13, :limit => 4
      t.integer :sab14, :limit => 4

      t.timestamps
    end
  end
end
