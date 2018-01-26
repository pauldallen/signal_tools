require_relative '../../../spec_helper'

describe SignalTools::Technicals::SlowStochastic do
  before(:each) do
    allow_any_instance_of(SignalTools::StockData).to receive(:get_quote).and_return(data_for_tests(ticker))
    @stock = SignalTools::Stock.new(ticker)
    @stock_data = @stock.stock_data
  end

  it 'shoud calculate slow stochastic' do
    expect("0.900160").to eq("%.6f" % SignalTools::Technicals::SlowStochastic.new(@stock_data, 14, 5).calculate[:k][-1])
    expect("0.776419").to eq("%.6f" % SignalTools::Technicals::SlowStochastic.new(@stock_data, 14, 5).calculate[:k][-5])
    expect("0.875846").to eq("%.6f" % SignalTools::Technicals::SlowStochastic.new(@stock_data, 14, 5).calculate[:d][-1])
    expect("0.810854").to eq("%.6f" % SignalTools::Technicals::SlowStochastic.new(@stock_data, 14, 5).calculate[:d][-5])

    expect("0.886290").to eq("%.6f" % SignalTools::Technicals::SlowStochastic.new(@stock_data, 12, 3).calculate[:k][-1])
    expect("0.761814").to eq("%.6f" % SignalTools::Technicals::SlowStochastic.new(@stock_data, 12, 3).calculate[:k][-5])
    expect("0.901958").to eq("%.6f" % SignalTools::Technicals::SlowStochastic.new(@stock_data, 12, 3).calculate[:d][-1])
    expect("0.776161").to eq("%.6f" % SignalTools::Technicals::SlowStochastic.new(@stock_data, 12, 3).calculate[:d][-5])
  end
end