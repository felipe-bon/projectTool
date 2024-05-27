class CreateTarefas < ActiveRecord::Migration[7.1]
  def change
    create_table :tarefas do |t|
      t.text :descricao_tarefa
      t.integer :etapa
      t.integer :prioridade
      t.references :projeto, null: false, foreign_key: true

      t.timestamps
    end
  end
end
