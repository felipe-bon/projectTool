class DropResponsavel < ActiveRecord::Migration[7.1]
  def change
    drop_table :Responsavels
  end
end
