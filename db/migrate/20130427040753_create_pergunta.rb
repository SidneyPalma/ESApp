class CreatePergunta < ActiveRecord::Migration
  def change
    create_table :pergunta do |t|
      t.string :pergunta, :limit => 60

      t.timestamps
    end
  end
end
