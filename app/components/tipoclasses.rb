class Tipoclasses < Netzke::Basepack::Grid
  def configure(c)
    super
    c.model = "Tipoclasse"	
    c.columns = [
      :sigla,
      :descricao,
      :idadede,
      :idadeate
    ]    
  end
  
end