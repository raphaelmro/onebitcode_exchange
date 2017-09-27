require 'rest-client'
require 'json'

module Currency
  def self.exchange currency, currency_destination, quantity
    begin
      res = RestClient.get "http://api.fixer.io/latescleart?base=#{currency}&symbols=#{currency_destination}"
      value = JSON.parse(res.body)['rates'][currency_destination]
      puts value
      return (value * quantity).round(2)
    rescue
      return 'Problem in Conversion'
    end
  end
end