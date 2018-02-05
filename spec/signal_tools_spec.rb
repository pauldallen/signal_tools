require_relative 'yquotes_spec_helper'

describe YquotesSignalTools do

  before(:all) do
    @array1 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  end

  it 'should have valid test_sum_returns_the_correct_sum_of_array_elements' do
    expect(YquotesSignalTools::sum(@array1)).to eq(55)
  end

  it 'should have valid test_average_returns_the_correct_average_of_array_elements' do
    expect(YquotesSignalTools::average(@array1)).to eq(5.5)
  end

  it 'should have valid test_truncate_to_shortest_returns_two_arrays_of_equal_size' do
    array2 = [1, 2, 3]
    YquotesSignalTools::truncate_to_shortest!(@array1, array2)
    expect(@array1.size).to eq(array2.size)
  end
end
