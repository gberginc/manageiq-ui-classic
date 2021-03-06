module ApplicationController::Tenancy
  extend ActiveSupport::Concern

  included do
    helper_method :current_tenant
  end

  def current_tenant
    @current_tenant ||=
      #  Tenant.where(:subdomain => request.subdomains.last).first ||
      #  Tenant.where(:domain => request.domain).first ||
      current_user.try(:current_tenant) || Tenant.default_tenant
  end

  # NOTE: remove when these session vars are removed
  def set_session_tenant(tenant = current_tenant)
    session[:customer_name] = tenant.try(:name)
    tenant
  end
end
