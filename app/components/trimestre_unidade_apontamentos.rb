class TrimestreUnidadeApontamentos < Netzke::Base
  # Remember regions collapse state and size
  include Netzke::Basepack::ItemPersistence
  
  def configure(c)
    super
    c.items = [
      { netzke_component: :trimestres, region: :center },
      #{ netzke_component: :unidades, region: :east, width: 240, split: true },
      { netzke_component: :unidades, region: :east},
      #{ netzke_component: :apontamentos, region: :south, height: 400, split: true },
      #{ netzke_component: :respostas, region: :south, height: 400, split: true }
      { netzke_component: :apontamentos, region: :south,  split: true },
      { netzke_component: :respostas, region: :south,  split: true }
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
        //var view = nil
        var view = this.getComponent('unidades').getView();   
        view.on('itemclick', function(view, record){
          this.selectUnidade({unidade_id: record.get('id')});
          
          this.getComponent('apontamentos').getStore().load();

          this.getComponent('respostas').getStore().load();

        }, this);

        // setting the 'rowclick' event
        //var view = nil
        var view = this.getComponent('trimestres').getView();   
        view.on('itemclick', function(view, record){
          // The beauty of using Ext.Direct: calling 3 endpoints in a row, which results in a single call to the server!
          this.selectTrimestre({trimestre_id: record.get('id')});
          
          this.getComponent('apontamentos').getStore().load();

          this.getComponent('respostas').getStore().load();

        }, this);

      }
    JS
  end

  endpoint :select_trimestre do |params, this|
    component_session[:selected_trimestre_id] = params[:trimestre_id]
  end
  
  endpoint :select_unidade do |params, this|
    component_session[:selected_unidade_id] = params[:unidade_id]
  end
  
  endpoint :select_resposta do |params, this|
    component_session[:selected_resposta_id] = params[:resposta_id]
  end

  component :trimestres do |c|
    c.klass =  Netzke::Basepack::Grid  #Trimestres
    c.model = "Trimestre"
    c.columns = [
      {:name => :trimestrefmt,
       :header => "Trimestre",
      },
      :ordinal,
      :meses      
    ]

    c.bbar = []
    c.context_menu = [false,false,false]
    c.enable_pagination = false
    
    c.scope = {:ativo => true}    

    
  end

  component :unidades do |c|
    c.klass = Unidades
    c.model = "Unidade"
    
    c.bbar = []
    c.context_menu = [false,false,false]
    c.enable_pagination = false
    
  end

  component :apontamentos do |c|
    c.klass = Netzke::Basepack::Grid #Apontamentos
    c.model = "Apontamento"
    c.persistence = true 
    c.data_store = {
      :auto_load => false,
      :sorters => [{:property => 'aluno__nome', :direction => 'ASC' }]
    }
    
    c.scope = {
      :trimestre_id => component_session[:selected_trimestre_id],
      :unidade_id => component_session[:selected_unidade_id]      
    }
    
    c.strong_default_attrs = {
      :trimestre_id => component_session[:selected_trimestre_id],
      :unidade_id => component_session[:selected_unidade_id]       
    }
 
    c.columns = [
      { :name => "aluno__nome",
        :header => "Aluno",
        :width => 300 ,
        :scope => ["alunos.unidade_id = #{component_session[:selected_unidade_id]}" ] 
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
  
  component :respostas do |c|
    c.klass =  Netzke::Basepack::Grid #Respostas  #
    c.model = "Resposta"
    
    c.columns = [     
      { :name => :pergunta__pergunta,
        :header => "Pergunta",
        :width => 300
      },      
      {:name => :sab01, :width => 50}, 
      {:name => :sab02, :width => 50}, 
      {:name => :sab03, :width => 50}, 
      {:name => :sab04, :width => 50}, 
      {:name => :sab05, :width => 50}, 
      {:name => :sab06, :width => 50}, 
      {:name => :sab07, :width => 50}, 
      {:name => :sab08, :width => 50}, 
      {:name => :sab09, :width => 50}, 
      {:name => :sab10, :width => 50}, 
      {:name => :sab11, :width => 50}, 
      {:name => :sab12, :width => 50}, 
      {:name => :sab13, :width => 50}, 
      {:name => :sab14, :width => 50} 
    ]            
    
#    c.bbar = []
#    c.context_menu = [false,false,false]
#    c.enable_pagination = false

    
    c.data_store = {auto_load: false}
    c.scope = {
      :trimestre_id => component_session[:selected_trimestre_id],
      :unidade_id => component_session[:selected_unidade_id]      
    }

    c.strong_default_attrs = {
      :trimestre_id => component_session[:selected_trimestre_id],
      :unidade_id => component_session[:selected_unidade_id]       
    }

    
  end
  
end
