require_relative '../../../yquotes_spec_helper'

describe YquotesSignalTools::Technicals::Common do
  include ::YquotesSignalTools::Technicals::Common

  before(:each) do
    @arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]
    @hsh = {'one' => [1,2,3,5,6], 'two' => [7,8,9,10,11]}
  end
  it 'should get_for_period' do
    expect(5).to eq(get_for_period(@arr, 0, 5 - 1, :max))
  end

  it 'should trim_data_to_range for array' do
    expect([9,0]).to eq(trim_data_to_range(@arr, 2))
  end

  it 'should trim_data_to_range for hash' do
    expect({"one"=>[1, 2], "two"=>[7, 8]}).to eq(trim_data_to_range(@hsh, 2))
  end

  it 'should calculate default_simple_average' do
    expect(1.5).to eq(default_simple_average(@arr, 2))
  end

  it 'should return collection_for_array' do
    expect([1.5, 2.5, 3.5, 4.5, 5.5, 6.5, 7.5, 8.5, 4.5]).to eq(collection_for_array(@arr, 2, :average))
  end
end