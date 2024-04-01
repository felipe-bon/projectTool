class RemoveUserIdFromProjetos < ActiveRecord::Migration[7.1]
  def change
    remove_reference :projetos, :user, null: false, foreign_key: true
  end
end
