class Tarefa < ApplicationRecord
  belongs_to :projeto
  validates :id, uniqueness: { scope: :projeto_id }
  validates :descricao_tarefa, presence: true
  validates :etapa, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 } 
end
