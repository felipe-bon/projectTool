class AddAdmToMembros < ActiveRecord::Migration[7.1]
  def change
    add_column :membros, :adm, :boolean
  end
end
