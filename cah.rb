require 'open-uri'
require 'nokogiri'
require 'pp'

document = Nokogiri::HTML(open('http://cah.frustratednerd.com/'))
links = document.css('.textwidget a').map { |link| link['href'] }

@whites = []
@blacks = []

links.each { |href|
  #puts "Parsing #{href}"

  begin
    doc = Nokogiri::HTML(open(href.to_s))
    whites = doc.css('.entry-content ul:first-of-type li')
                .map(&:text)
    @whites += whites if whites.count > 0

    blacks = doc.css('.entry-content ul:nth-of-type(2) li')
                .map(&:text)
    @blacks += blacks if blacks.count > 0
  rescue OpenURI::HTTPError
    puts "Bad URI"
  end
}

#puts "************ Whites ************"
#@whites.each { |white| pp "WhiteCard.create(title: '#{white}')" }

puts "************ Blacks ************"
@blacks.each { |black| pp "BlackCard.create(title: '#{black}')" }
