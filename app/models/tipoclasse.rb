class Tipoclasse < ActiveRecord::Base
  attr_accessible :descricao, :idadeate, :idadede, :sigla
  has_many :unidades
end
