class HomeController < ApplicationController
  def index
    @api = StockQuote::Stock.new(api_key: 'pk_90dd9d4ea08c4c30a8ee233df365eaad')
    if params[:ticker] == ""
      @nothing = "Please enter a symbol"
    elsif params[:ticker]
      @stock = StockQuote::Stock.quote(params[:ticker])
      if !@stock
        @error = "Stock not found, enter another symbol"
      end
    end
  end

  def about
  end

end
