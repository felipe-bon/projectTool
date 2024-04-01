class CreateProjetos < ActiveRecord::Migration[7.1]
  def change
    create_table :projetos do |t|
      t.string :nome
      t.string :codigo_de_acesso
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
