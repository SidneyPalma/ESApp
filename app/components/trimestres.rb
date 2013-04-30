class Trimestres < Netzke::Basepack::Grid
  def configure(c)
    super
    c.model = "Trimestre"	
    c.columns = [
      :trimestre,
      :ano,  
      :trim,
      :qtde_sabados,
      :ativo
    ]
    c.data_store.sorters = [{ property: 'trimestre', direction: 'ASC' }]
  end
  
#  def default_bbar
#    res = []
#    res
#  end
  
end