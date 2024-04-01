class RenameProjetoIdToprojetoId < ActiveRecord::Migration[7.1]
  def change
    rename_column :tarefas, :Projeto_id, :id_projeto
  end
end
