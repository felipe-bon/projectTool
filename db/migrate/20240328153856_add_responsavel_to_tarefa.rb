class AddResponsavelToTarefa < ActiveRecord::Migration[7.1]
  def change
    add_reference :tarefas, :user, null: true, foreign_key: true
  end
end
