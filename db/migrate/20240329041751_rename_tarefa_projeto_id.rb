class RenameTarefaProjetoId < ActiveRecord::Migration[7.1]
  def change
    rename_column :tarefas, :id_projeto, :projeto_id
  end
end
