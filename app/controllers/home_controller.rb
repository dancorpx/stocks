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
      
      # Because this API returns shit if it cant find anything, custom error handling.
      if @response.body == "Unknown symbol"
        @error = "Stock not found, enter another symbol"
      else
        @output = JSON.parse(@response.body)
        
        # run API to get logo
        @logoUrl = "https://cloud.iexapis.com/stable/stock/" + @api + "/logo?token=pk_90dd9d4ea08c4c30a8ee233df365eaad"  
        @logoUri = URI(@logoUrl)
        @logoResponse = Net::HTTP.get(@logoUri)
        @logoOutput = JSON.parse(@logoResponse)
        
        # create varibles to send to view
        @companyName = @output['companyName']
        @symbol = @output['symbol']
        @latestPrice = @output['latestPrice']
        @changePercent = @output['changePercent']
        @primaryExchange = @output['primaryExchange']
        @logoUrlOutput = @logoOutput['url']
      end
    end
  end

  def about
  end
end
