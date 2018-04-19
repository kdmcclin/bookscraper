require 'open-uri'
require 'pry'
require 'nokogiri'

url = "https://www.packtpub.com/packt/offers/free-learning"
html = open(url, 'User-Agent' => "Ruby/#{RUBY_VERSION}")

doc = Nokogiri::HTML(html)

title = doc.css('.dotd-title').text.strip

summary = doc.at('//div[@class="dotd-main-book-summary float-left"]/*[4]').text.strip

bullet_points = doc.at('//div[@class="dotd-main-book-summary float-left"]/*[5]').text.strip.split(/\n|\r/).reject(&:empty?)

puts title, summary, bullet_points

puts "Based on this information, would you like to get this book? (y/n)"

response = gets.chomp

if response == "y"
  system "open #{url}"
else
  "Better luck tomorrow"
  exit
end
