# Start coding your hackernews scraper here!
require 'open-uri'
require 'Nokogiri'

html_file = open('hacker.html')

# puts html_file.read

doc = Nokogiri::HTML(html_file)

###############################

puts doc

doc.search('.comhead > a:first-child').map do |element|
  p element.inner_text
end

doc.css('.comhead').css('.hnuser').each do |element|
  p element.inner_text
end

#sample output

#<Nokogiri::XML::Element:0x3fc274416880 name="a" attributes=[#<Nokogiri::XML::Attr:0x3fc274416808 name="class" value="togg">, #<Nokogiri::XML::Attr:0x3fc2744167f4 name="n" value="1">, #<Nokogiri::XML::Attr:0x3fc2744167e0 name="href" value="javascript:void(0)">, #<Nokogiri::XML::Attr:0x3fc2744167cc name="onclick" value="return toggle(event, 5004627)">]>
#<Nokogiri::XML::Element:0x3fd73142ead0 name="a" attributes=[#<Nokogiri::XML::Attr:0x3fd73142ea58 name="href" value="user?id=karolisd">, #<Nokogiri::XML::Attr:0x3fd73142ea44 name="class" value="hnuser">] children=[#<Nokogiri::XML::Text:0x3fd73142e404 "karolisd">]>
#<Nokogiri::XML::Element:0x3fe25a10373c name="a" attributes=[#<Nokogiri::XML::Attr:0x3fe25a1036c4 name="href" value="user?id=karolisd">, #<Nokogiri::XML::Attr:0x3fe25a1036b0 name="class" value="hnuser">] children=[#<Nokogiri::XML::Text:0x3fe25a103070 "karolisd">]>

###############################

doc.search('.subtext > span:first-child').map do |span|
  p span.inner_text
end

doc.search('.subtext > a:nth-child(3)').map {|link|
  p link['href'].class
p "nothing" }

doc.search('.title > a:first-child').map { |link| p link.inner_text}

doc.search('.title > a:first-child').map { |link| p link['href']}
