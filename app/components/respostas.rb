class Respostas < Netzke::Basepack::Grid
  def configure(c)
    super
    c.model = "Resposta"	    
    c.columns = [
      { :name => :trimestre__trimestre,
        :header => "Trimestre"
      },
      { :name => :unidade__nome,
        :header => "Unid. Acao"
      },      
      { :name => :pergunta__pergunta,
        :header => "Pergunta",
        :width => 300
      },
      
      :sab01, 
      :sab02, 
      :sab03, 
      :sab04, 
      :sab05, 
      :sab06, 
      :sab07, 
      :sab08, 
      :sab09, 
      :sab10, 
      :sab11, 
      :sab12, 
      :sab13, 
      :sab14       
    ]            
  end
  
end