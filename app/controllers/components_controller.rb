class ComponentsController < ApplicationController
  def index
    component_name = params[:component].gsub("::", "_").underscore
    render :inline => "<% title '#{params[:component]}', false %><%= netzke :#{component_name}, :class_name => '#{params[:component]}', :height => 500 %>", :layout => true
  end
  
  before_filter :set_locale
  def set_locale
    # se params[:locale] for nulo, então deve-se utilizar I18n.default_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  
end
