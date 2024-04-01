class AddVencimentoToTarefas < ActiveRecord::Migration[7.1]
  def change
    add_column :tarefas, :vencimento, :date
  end
end
