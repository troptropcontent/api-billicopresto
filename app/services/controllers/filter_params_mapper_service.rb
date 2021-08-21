class FilterParamsMapperService

  SUFFIX_REQUIRING_TRANSFORMATION = ["_cent"] 
    


  def initialize(filter_params)
    @filter_params = filter_params
    @mapped_params = filter_params
  end

  def call!

  end

  private

  def mapped_value(key, value)
    return @mapped_params[key] unless @mapped_params[value].end_with?(*SUFFIX_REQUIRING_TRANSFORMATION)
    @mapped_params[key]*100
  end
end