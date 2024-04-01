class CreateMembros < ActiveRecord::Migration[7.1]
  def change
    create_table :membros do |t|
      t.references :user, null: false, foreign_key: true
      t.references :projeto, null: false, foreign_key: true
      t.string :cargo

      t.timestamps
    end
  end
end
