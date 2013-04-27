class Resposta < ActiveRecord::Base
  belongs_to :trimestre
  belongs_to :unidade 
  belongs_to :pergunta
  attr_accessible :pergunta_id, :sab01, :sab02, :sab03, :sab04, :sab05, :sab06, :sab07, :sab08, :sab09, :sab10, :sab11, :sab12, :sab13, :sab14, :trimestre_id, :unidade_id
end
