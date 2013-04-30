class UnidadesComAlunos < Netzke::Base
  # Remember regions collapse state and size
  include Netzke::Basepack::ItemPersistence

  def configure(c)
    super
    c.items = [
      { netzke_component: :unidades, region: :center },
      { netzke_component: :alunos, region: :south, height: 400, split: true }
    ]
  end

  js_configure do |c|
    c.layout = :border
    c.border = false

    # Overriding initComponent
    c.init_component = <<-JS
      function(){
        // calling superclass's initComponent
        this.callParent();

        // setting the 'rowclick' event
        var view = this.getComponent('unidades').getView();
        view.on('itemclick', function(view, record){
          // The beauty of using Ext.Direct: calling 3 endpoints in a row, which results in a single call to the server!
          this.selectUnidade({unidade_id: record.get('id')});
          this.getComponent('alunos').getStore().load();
        }, this);
      }
    JS
  end

  endpoint :select_unidade do |params, this|
    # store selected boss id in the session for this component's instance
    component_session[:selected_unidade_id] = params[:unidade_id]
  end

  component :unidades do |c|
    c.klass = Unidades #Netzke::Basepack::Grid
    c.model = "Unidade"    
  end

  component :alunos do |c|
    c.klass = Netzke::Basepack::Grid #Alunos
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
    
    c.data_store = {
      auto_load: false, 
      sorters: [{ property: 'nome', direction: 'ASC' }]
    }
    
    c.scope = {
      :unidade_id => component_session[:selected_unidade_id]
    }
    
    c.strong_default_attrs = {:unidade_id => component_session[:selected_unidade_id]}
    
  end

#  component :boss_details do |c|
#    c.klass = BossDetails
#    c.boss_id = component_session[:selected_boss_id]
#  end

end
