require_relative '../../../yquotes_spec_helper'

describe YquotesSignalTools::Technicals::MACD do
  before(:each) do
    allow_any_instance_of(YquotesSignalTools::StockData).to receive(:get_quote).and_return(data_for_tests(ticker))
    @stock = YquotesSignalTools::Stock.new(ticker)
    @data = @stock.stock_data.close_prices
  end

  it 'should calculate macd' do
    expect("1.135625").to eq("%.6f" % YquotesSignalTools::Technicals::MACD.new(@data, 8, 17, 9).calculate[:signal_points][-1])
    expect("0.894943").to eq("%.6f" % YquotesSignalTools::Technicals::MACD.new(@data, 8, 17, 9).calculate[:signal_points][-5])
    expect("0.257017").to eq("%.6f" % YquotesSignalTools::Technicals::MACD.new(@data, 8, 17, 9).calculate[:divergences][-1])
    expect("0.200184").to eq("%.6f" % YquotesSignalTools::Technicals::MACD.new(@data, 8, 17, 9).calculate[:divergences][-5])

    expect("1.440597").to eq("%.6f" % YquotesSignalTools::Technicals::MACD.new(@data, 12, 26, 9).calculate[:signal_points][-1])
    expect("1.180617").to eq("%.6f" % YquotesSignalTools::Technicals::MACD.new(@data, 12, 26, 9).calculate[:signal_points][-5])
    expect("0.288450").to eq("%.6f" % YquotesSignalTools::Technicals::MACD.new(@data, 12, 26, 9).calculate[:divergences][-1])
    expect("0.209554").to eq("%.6f" % YquotesSignalTools::Technicals::MACD.new(@data, 12, 26, 9).calculate[:divergences][-5])
  end
end