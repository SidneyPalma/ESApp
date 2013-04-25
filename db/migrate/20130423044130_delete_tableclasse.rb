class DeleteTableclasse < ActiveRecord::Migration
  def up
    drop_table :classes
  end

  def down
  end
end
