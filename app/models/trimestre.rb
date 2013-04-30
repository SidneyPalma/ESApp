class Trimestre < ActiveRecord::Base
  attr_accessible :ano, :qtde_sabados, :trim, :trimestre, :ativo
  has_many :apontamentos
  
  def trimestrefmt
      "#{ano}-#{trim}"
  end
  
  def ordinal          
    case "#{trim}"
    when "1" 
      "Primeiro"
    when "2"
      "Segundo"
    when "3"
      "Terceiro"  
    else
      "Quarto"
    end            
  end

  def meses          
    case "#{trim}"
    when "1" 
      "Jan/Fev/Mar"
    when "2"
      "Abr/Mai/Jun"
    when "3"
      "Jul/Ago/Set"  
    else
      "Out/Nov/Dez"
    end            
  end
  
end

