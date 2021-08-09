class ApplicationController < ActionController::Base

	rescue_from CanCan::AccessDenied do
	  render json: {code: :forbidden, message: I18n.t("cancan.access_denied")}, status: :forbidden
	end
end
