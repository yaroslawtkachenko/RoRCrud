class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # before_action :set_locale
  # # def set_locale
  # #   I18n.locale = current_user.try(:locale) || I18n.default_locale
  # # end
  # def default_url_options
  #   { locale: I18n.locale }
  # end
end
