class RenameProjetoIdToprojetoId < ActiveRecord::Migration[7.1]
  def change
    rename_column :tarefas, :projeto_id, :id_projeto
  end
end
