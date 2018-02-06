require_relative './common'
require_relative './stochastic'

module YquotesSignalTools::Technicals
  class FastStochastic
    include Common
    include Stochastic

    def initialize(stock_data, k_period, d_period)
      @d_period = d_period
      @k_period = k_period
      @stock_data = stock_data
    end

    def calculate
      fast_stochastic_points
    end
  end
end