require 'yquotes'
require 'date'

module SignalTools
  class StockData
    # Extra days needed to produce accurate data for the desired date.
    Extra_Days = 365
    Indexes = {
      :date           => 0,
      :open           => 1,
      :high           => 2,
      :low            => 3,
      :close          => 4,
#Presently unused
#      :adj_close => 5,
#      :volume         => 6
    }
    attr_reader :raw_data, :dates, :client

    #Downloads historical prices using the YahooFinance gem.
    def initialize(ticker, from_date, to_date)
      @from_date = from_date
      @to_date = to_date
      # @raw_data = YahooFinance::get_historical_quotes(ticker, @from_date-Extra_Days, to_date).reverse
      quote = get_quote(ticker)
      @raw_data = transpose_reverse(quote)
      convert_raw_data_strings!
      # We will never have need of the extraneous dates so we trim here
      @dates = trim_dates
    end

    def get_quote(ticker)
      @client ||= YQuotes::Client.new
      client.get_quote(ticker, {
        start_date: (@from_date-Extra_Days).to_s,
        end_date: @to_date.to_s
      })
    end
    def transpose_reverse(vector_matrix)
      vt = vector_matrix.transpose.dup
      vt.vectors.each do |vec|
        vt.delete_vector(vec)
      end
      vector_matrix.transpose.each_vector_with_index do |vec, idx|
        vt.add_vector(vector_matrix.size - idx, vec)
      end
    end
    def open_prices
      @open_prices ||= @raw_data.map { |d| d[Indexes[:open]] }
    end

    def high_prices
      @high_prices ||= @raw_data.map { |d| d[Indexes[:high]] }
    end

    def low_prices
      @low_prices ||= @raw_data.map { |d| d[Indexes[:low]] }
    end

    def close_prices
      @close_prices ||= @raw_data.map { |d| d[Indexes[:close]] }
    end

    private

    def convert_raw_data_strings!(*indexes)
      @raw_data.each do |datum|
        datum[Indexes[:date]] = Date.parse(datum[Indexes[:date]])
        datum[Indexes[:open]] = datum[Indexes[:open]].to_f
        datum[Indexes[:high]] = datum[Indexes[:high]].to_f
        datum[Indexes[:low]] = datum[Indexes[:low]].to_f
        datum[Indexes[:close]] = datum[Indexes[:close]].to_f
      end
    end

    def trim_dates
      dates = @raw_data.map { |d| d[Indexes[:date]] }
      index = binary_search_for_date_index(dates)
      dates[(index+1)..-1]
    end

    # Performs a binary search for @from_date on @dates. Returns the index of @from_date.
    def binary_search_for_date_index(dates, low=0, high=dates.size-1)
      return low if high <= low    # closest match
      mid = low + (high - low) / 2
      if dates[mid] > @from_date
        binary_search_for_date_index(dates, low, mid-1)
      elsif dates[mid] < @from_date
        binary_search_for_date_index(dates, mid+1, high)
      else
        mid
      end
    end
  end
end
