class Alunos < Netzke::Basepack::Grid
  def configure(c)
    super
    c.model = "Aluno"	
    
    c.columns = [
      #:pathSdy,
      {:name => :nome,
       :width => 300
      },
      :fone, 
      {:name => :nascimento,
       :format => I18n.t('netzke.formats.date') #"d/m/Y"
      },
      {:name => :idade,
       :width => 50
      },
      {:name => :batismo,
      :format => I18n.t('netzke.formats.date') #"d/m/Y"      
      },
      {:name => :batizado,
       :width => 50 
      },
      {:name => :email,
        :width => 200
      },
      {:name =>:endereco,
       :width => 300
      },
      { :name => :unidade__nome,
        :header => "Unid. Acao"
      }
    ]
    c.data_store.sorters = [{ property: 'nome', direction: 'ASC' }]
  end
  
end