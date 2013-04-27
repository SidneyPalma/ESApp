class Perguntas < Netzke::Basepack::Grid
  def configure(c)
    super
    c.model = "Pergunta"	
    c.columns = [
      {
        :name => :pergunta,
        :width => 300
      }
      
    ]    
  end
  
end