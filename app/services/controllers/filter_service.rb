module Services
  class Controllers::FilterService
    SUFFIX_WHITELIST = %w[_less _more _not]
    def initialize(collection, filter_params: {})
      @collection = collection
      @filtered_collection = @collection
      @filter_params = filter_params
      @classic_filters = classic_filters
      @not_filters = not_filters
      @less_filters = less_filters
      @more_filters = more_filters
    end

    def filter!
      return @collection unless @filter_params
      classic_filter
      not_filter if @not_filters
      less_filter if @less_filters
      more_filter if @more_filters
      @filtered_collection
    end

    private

    def classic_filter
      @filtered_collection = @filtered_collection.where(@classic_filters)
    end

    def not_filter
      @filtered_collection = @filtered_collection.where.not(@not_filters.transform_keys { |k| k.delete_suffix("_not") })
    end

    def less_filter
      less_filters.each do |field, value|
        @filtered_collection = @filtered_collection.where("#{with_no_suffix(field)} < ?", value)
      end
    end

    def more_filter
      more_filters.each do |field, value|
        @filtered_collection = @filtered_collection.where("#{with_no_suffix(field)} > ?", value)
      end
    end

    def classic_filters
      @filter_params.reject{|k,v| SUFFIX_WHITELIST.any?{|suffix| k.end_with?(suffix)}}
    end

    def not_filters
      @filter_params.select{|k,v| k.end_with?("_not")}
    end

    def less_filters
      @filter_params.select{|k,v| k.end_with?("_less")}
    end

    def more_filters
      @filter_params.select{|k,v| k.end_with?("_more")}
    end

    def with_no_suffix(filter)
      suffix_to_delete = ""
      SUFFIX_WHITELIST.each do |suffix|
        suffix_to_delete = suffix if filter.end_with?(suffix)
      end
      filter.delete_suffix(suffix_to_delete)
    end

  end
end