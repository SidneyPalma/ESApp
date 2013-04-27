class Unidades < Netzke::Basepack::Grid
  def configure(c)
    super
    c.model = "Unidade"	    
    #c.persistence = true    
    c.columns = [
      :nome,
      { :name => :tipoclasse__sigla,
        :header => "Tipo Classe"
      },
      :professor,
      :associado,
      :secretario
    ]            
  end
  
end