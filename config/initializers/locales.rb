###
# The default locale is :en and all translations from config/locales/*.rb,yml
# are auto loaded.
#------------------------------------------------------------------------------
Rails.application.config.i18n.load_path += Dir[
  Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s
]

###
# Set russian as default locale
#------------------------------------------------------------------------------
Rails.application.config.i18n.default_locale = :ru
