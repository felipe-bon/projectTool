class CreateResponsavels < ActiveRecord::Migration[7.1]
  def change
    create_table :responsavels do |t|
      t.references :user, null: false, foreign_key: true
      t.references :tarefa, null: false, foreign_key: true

      t.timestamps
    end
  end
end
