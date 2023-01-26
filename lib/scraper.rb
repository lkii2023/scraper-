require 'open-uri'
require 'rubygems'
require 'nokogiri'

url = "https://coinmarketcap.com/all/views/all/"

page = Nokogiri::HTML(URI.open(url))

cryptos_arr = []

i = 1
while true do
  crypto_name = page.xpath("//*[@id='__next']/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[#{i}]/td[3]").text
  crypto_value = page.xpath("//*[@id='__next']/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[#{i}]/td[5]").text
  break if crypto_name.empty?
  cryptos_arr.push({crypto_name => crypto_value})
  i += 1
end

puts cryptos_arr

