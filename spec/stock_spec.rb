require_relative 'spec_helper'

describe SignalTools::Stock do
  before(:each) do
    allow_any_instance_of(SignalTools::StockData).to receive(:get_quote).and_return(data_for_tests(ticker))
    @stock = SignalTools::Stock.new(ticker)
  end

  it 'test_stock_should_have_correct_number_of_data_elements' do
    expect(@stock.dates.size).to eq(58)
    expect(@stock.ema.size).to eq(58)
    expect(@stock.macd[:divergences].size).to eq(58)
    expect(@stock.fast_stochastic[:k].size).to eq(58)
    expect(@stock.slow_stochastic[:k].size).to eq(58)
    expect(@stock.average_true_range.size).to eq(58)
    expect(@stock.average_directional_index.size).to eq(58)
  end

end
