require_relative 'yquotes_spec_helper'

describe YquotesSignalTools::Stock do
  before(:each) do
    allow_any_instance_of(YquotesSignalTools::StockData).to receive(:get_quote).and_return(data_for_tests(ticker))
    @stock = YquotesSignalTools::Stock.new(ticker)
  end

  it 'test_stock_should_have_correct_number_of_data_elements' do
    expect(@stock.dates.size).to be > 10
    expect(@stock.ema.size).to be > 10
    expect(@stock.macd[:divergences].size).to be > 10
    expect(@stock.fast_stochastic[:k].size).to be > 10
    expect(@stock.slow_stochastic[:k].size).to be > 10
    expect(@stock.average_true_range.size).to be > 10
    expect(@stock.average_directional_index.size).to be > 10
  end

end
