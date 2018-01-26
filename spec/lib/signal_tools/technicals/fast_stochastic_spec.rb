require_relative '../../../spec_helper'

describe SignalTools::Technicals::FastStochastic do
  before(:each) do
    allow_any_instance_of(SignalTools::StockData).to receive(:get_quote).and_return(data_for_tests(ticker))
    @stock = SignalTools::Stock.new(ticker)
    @stock_data = @stock.stock_data
  end

  it 'should calculate fast stochastic' do
    expect("0.765306").to eq("%.6f" % SignalTools::Technicals::FastStochastic.new(@stock_data, 14, 5).calculate[:k][-1])
    expect("0.869565").to eq("%.6f" % SignalTools::Technicals::FastStochastic.new(@stock_data, 14, 5).calculate[:k][-5])
    expect("0.884141").to eq("%.6f" % SignalTools::Technicals::FastStochastic.new(@stock_data, 14, 5).calculate[:d][-1])
    expect("0.824323").to eq("%.6f" % SignalTools::Technicals::FastStochastic.new(@stock_data, 14, 5).calculate[:d][-5])

    expect("0.739903").to eq("%.6f" % SignalTools::Technicals::FastStochastic.new(@stock_data, 12, 3).calculate[:k][-1])
    expect("0.869565").to eq("%.6f" % SignalTools::Technicals::FastStochastic.new(@stock_data, 12, 3).calculate[:k][-5])
    expect("0.886290").to eq("%.6f" % SignalTools::Technicals::FastStochastic.new(@stock_data, 12, 3).calculate[:d][-1])
    expect("0.761814").to eq("%.6f" % SignalTools::Technicals::FastStochastic.new(@stock_data, 12, 3).calculate[:d][-5])
  end
end