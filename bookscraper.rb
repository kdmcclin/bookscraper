require 'open-uri'
require 'pry'
require 'nokogiri'

url = "https://www.packtpub.com/packt/offers/free-learning"
html = open(url, 'User-Agent' => "Ruby/#{RUBY_VERSION}")

doc = Nokogiri::HTML(html)

title = doc.css('.dotd-title').text.strip

# summary = doc.search('.dotd-main-book-summary:nth-child(2)')

# puts summary
