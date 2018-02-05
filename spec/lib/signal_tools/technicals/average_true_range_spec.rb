require_relative '../../../yquotes_spec_helper'

describe YquotesSignalTools::Technicals::AverageTrueRange do
  before(:each) do
    @days = 90
    allow_any_instance_of(YquotesSignalTools::StockData).to receive(:get_quote).and_return(data_for_tests(ticker))
    @stock = YquotesSignalTools::Stock.new(ticker)
    @stock_data = @stock.stock_data
  end

  it 'should test_calculate' do
    expect("1.265512").to eq("%.6f" % YquotesSignalTools::Technicals::AverageTrueRange.new(@stock_data, 14).calculate[-1])
    expect("1.227821").to eq("%.6f" % YquotesSignalTools::Technicals::AverageTrueRange.new(@stock_data, 14).calculate[-5])
    expect("1.258866").to eq("%.6f" % YquotesSignalTools::Technicals::AverageTrueRange.new(@stock_data, 15).calculate[-1])
    expect("1.222364").to eq("%.6f" % YquotesSignalTools::Technicals::AverageTrueRange.new(@stock_data, 15).calculate[-5])
  end
end