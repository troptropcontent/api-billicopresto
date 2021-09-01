class FilterParamsWhitelistService
  def initialize(filter_params, field_filter_whitelist = [])
    @filter_params = filter_params
    @filter_params_whitelist = field_filter_whitelist.map{|filter| filter.to_s}
  end

  def call!
    return {} unless @filter_params_whitelist
    @filter_params.slice(*@filter_params_whitelist)
  end
end