class TipoclassesComUnidades < Netzke::Base
  # Remember regions collapse state and size
  include Netzke::Basepack::ItemPersistence

  def configure(c)
    super
    c.items = [
      { netzke_component: :tipoclasses, region: :center },
      { netzke_component: :unidades, region: :east, width: 500 }
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
        var view = this.getComponent('tipoclasses').getView();
        view.on('itemclick', function(view, record){
          // The beauty of using Ext.Direct: calling 3 endpoints in a row, which results in a single call to the server!
          this.selectTipoclasse({tipoclasse_id: record.get('id')});
          this.getComponent('unidades').getStore().load();
        }, this);
      }
    JS
  end

  endpoint :select_tipoclasse do |params, this|
    # store selected boss id in the session for this component's instance
    component_session[:selected_tipoclasse_id] = params[:tipoclasse_id]
  end

  component :tipoclasses do |c|
    c.klass =  Tipoclasses #Netzke::Basepack::Grid
    c.model = "Tipoclasse"
  end

  component :unidades do |c|
    c.klass = Unidades
    c.data_store = {auto_load: false}
    c.scope = {:tipoclasse_id => component_session[:selected_tipoclasse_id]}
    c.strong_default_attrs = {:tipoclasse_id => component_session[:selected_tipoclasse_id]}
  end

#  component :boss_details do |c|
#    c.klass = BossDetails
#    c.boss_id = component_session[:selected_boss_id]
#  end

end
