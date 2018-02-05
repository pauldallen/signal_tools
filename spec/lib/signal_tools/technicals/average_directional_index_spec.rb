require_relative '../../../yquotes_spec_helper'

describe YquotesSignalTools::Technicals::AverageDirectionalIndex do

  before(:each) do
    @days = 90
    allow_any_instance_of(YquotesSignalTools::StockData).to receive(:get_quote).and_return(data_for_tests(ticker))
    @stock = YquotesSignalTools::Stock.new(ticker)
    @stock_data = @stock.stock_data
  end

  it 'should test_calculate correctly' do
    expect("0.411893").to eq("%.6f" % YquotesSignalTools::Technicals::AverageDirectionalIndex.new(@stock_data, 14).calculate[-1])
    expect("0.334966").to eq("%.6f" % YquotesSignalTools::Technicals::AverageDirectionalIndex.new(@stock_data, 14).calculate[-5])
  end
end