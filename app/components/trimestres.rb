class Trimestres < Netzke::Basepack::Grid
  def configure(c)
    super
    c.model = "Trimestre"	
    c.columns = [
      :trimestre,
      :ano,  
      :trim,
      :qtde_sabados
    ]    
  end
  
end