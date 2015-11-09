ActiveAdmin.register_page "Settings" do
  title = proc { I18n.t('settings.menu.label') }

  menu label: title, priority: 99

  controller do
  	def index
  		params[:settings].each do |k,v|
  			settings_model[k] = v
  		end
  		# Settings.email = params[:settings][:email] if params[:settings]
  	end
  	private 
  	def settings_model
      ActiveadminSettingsCached.config.model_name
    end
  end

  content title: title  do
    render partial: 'admin/settings/index'
  end

  controller do
    helper :settings
  end
end
