class Task < ApplicationRecord
  validates_presence_of :titulo, :descricao

  def to_status
    case status
    when "pendente"
      "Pendente"
    when "em_andamento"
      "Em andamento"
    when "concluido"
      "Concluído"
    else
      status.to_s
    end
  end
end
