class DropResponsavel < ActiveRecord::Migration[7.1]
  def change
    drop_table :responsavels
  end
end
