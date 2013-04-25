class Aluno < ActiveRecord::Base
  belongs_to :unidade
  attr_accessible :batismo, :email, :endereco, :fone, :nascimento, :nome, :unidade_id
  
#  def idade        
#    now = Time.now.utc.to_date
#    now.year - nascimento.year - (nascimento.to_date.change(:year => now.year) > now ? 1 : 0)  
#  end

    def idade
      if nascimento != nil
        now = Time.now.utc.to_date
        now.year - nascimento.year - ((now.month > nascimento.month || (now.month == nascimento.month && now.day >= nascimento.day)) ? 0 : 1)
      else
        '--'
      end      
    end
    
    def pathSdy
      #File.dirname(__FILE__) + '/../locales/pt-BR.yml'
      #I18n.load_path
      I18n.t('netzke.formats.date')
      #I18n.default_locale
    end

    def batizado
      if batismo != nil 
        'Sim'
      else
        'Não'
      end    
    end
        
end
