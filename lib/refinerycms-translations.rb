require 'refinery'

module Refinery
  module Translations
    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end
      
      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "refinerycms_translations"
          plugin.url = {:controller => '/admin/translations', :action => 'index'}
          plugin.menu_match = /^\/?(admin|refinery)\/translations/
          plugin.activity = {:class => Translations,
          :title => 'name'
        }
        end
      end
    end
  end
end
