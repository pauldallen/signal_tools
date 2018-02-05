require_relative 'yquotes_spec_helper'

describe YquotesSignalTools::Stock do
  before(:each) do
    allow_any_instance_of(YquotesSignalTools::StockData).to receive(:get_quote).and_return(data_for_tests(ticker))
    @stock = YquotesSignalTools::Stock.new(ticker)
  end

  it 'test_stock_should_have_correct_number_of_data_elements' do
    expect(@stock.dates.size).to eq(53)
    expect(@stock.ema.size).to eq(53)
    expect(@stock.macd[:divergences].size).to eq(53)
    expect(@stock.fast_stochastic[:k].size).to eq(53)
    expect(@stock.slow_stochastic[:k].size).to eq(53)
    expect(@stock.average_true_range.size).to eq(53)
    expect(@stock.average_directional_index.size).to eq(53)
  end

end
