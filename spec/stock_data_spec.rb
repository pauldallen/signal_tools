require_relative 'yquotes_spec_helper'

describe YquotesSignalTools::StockData do
  before(:each) do
    allow_any_instance_of(YquotesSignalTools::StockData).to receive(:get_quote).and_return(data_for_tests(ticker))
    @stock = YquotesSignalTools::Stock.new(ticker)
    @stock_data = @stock.stock_data
  end

  it 'should have valid test_dates' do
    expect(@stock_data.dates.size).to eq(52)
  end

  it 'should have valid test_open_prices' do
    result = @stock_data.open_prices.delete_if {|e| !e.is_a?(Float)}
    expect(result.size).to eq(312)
  end

  it 'should have valid test_high_prices' do
    result = @stock_data.high_prices.delete_if {|e| !e.is_a?(Float)}
    expect(result.size).to eq(312)
  end

  it 'should have valid test_low_prices' do
    result = @stock_data.low_prices.delete_if {|e| !e.is_a?(Float)}
    expect(result.size).to eq(312)
  end

  it 'should have valid test_close_prices' do
    result = @stock_data.close_prices.delete_if {|e| !e.is_a?(Float)}
    expect(result.size).to eq(312)
  end

end
