class Unidade < ActiveRecord::Base

  belongs_to :tipoclasse
  has_many :alunos
  has_many :apontamentos
  
  attr_accessible :nome, :tipoclasse_id, :professor, :associado, :secretario
    
end
