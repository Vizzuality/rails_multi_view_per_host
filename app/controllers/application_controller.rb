# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  AVAILABLE_HOSTS = %W{ example1.com test2.com www.foodomain.com }

  before_filter :set_site

  protected

    def set_site
      host = Rails.env.development? ? request.host.split('.')[1..-1].join('.') : request.host
      raise "Host not handled" unless AVAILABLE_HOSTS.include?(host)
      view_path = ActionView::PathSet.type_cast(["app/views/#{host}"])
      @template.view_paths = view_path
    end

end
