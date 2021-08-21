class ApplicationController < ActionController::Base
	require './app/services/controllers/filter_service.rb'

	rescue_from CanCan::AccessDenied do
	  render json: {code: :forbidden, message: I18n.t("cancan.access_denied")}, status: :forbidden
	end

end
