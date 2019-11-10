class HomeController < ApplicationController
  def index
    @api = params[:ticker]
    if params[:ticker] == ""
      @nothing = "Please enter a symbol"
    elsif params[:ticker]
      require 'json'
      require 'net/http'

      @url = "https://cloud.iexapis.com/stable/stock/" + @api + "/quote?token=pk_90dd9d4ea08c4c30a8ee233df365eaad"
      @uri = URI(@url)
      @response = Net::HTTP.get_response(@uri)
      @output = JSON.parse(@response.body)


      @logoUrl = "https://cloud.iexapis.com/stable/stock/" + @api + "/logo?token=pk_90dd9d4ea08c4c30a8ee233df365eaad"  
      @logoUri = URI(@logoUrl)
      @logoResponse = Net::HTTP.get(@logoUri)
      @logoOutput = JSON.parse(@logoResponse)

      if @response.message === "OK"
        @companyName = @output['companyName']
        @symbol = @output['symbol']
        @latestPrice = @output['latestPrice']
        @changePercent = @output['changePercent']
        @primaryExchange = @output['primaryExchange']
        @logoUrlOutput = @logoOutput['url']
      else
        @error = "Stock not found, enter another symbol"
      end
    end
  end

  def about
  end
end
