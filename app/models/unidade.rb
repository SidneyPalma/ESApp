class Unidade < ActiveRecord::Base

  belongs_to :tipoclasse
  has_many :alunos

  attr_accessible :nome, :tipoclasse_id

  
end
