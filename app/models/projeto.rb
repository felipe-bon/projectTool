class Projeto < ApplicationRecord

  has_many :membros, dependent: :destroy
  has_many :users, through: :membros

  has_many :tarefas, dependent: :destroy
end
