class CrawlAkhbarakJob < ApplicationJob
    queue_as :default

   def perform(*args)
    require 'nokogiri'
    require 'open-uri'
    require 'byebug'
    doc = Nokogiri::HTML(open('https://akhbarak.net/sections/Egypt'))
    links = doc.css("h4.media-heading a").map{|l| l['href']}
    titles = doc.xpath("//h4/a").map{|t|t.text}
    #saving scraped data in our database
    links.each_with_index do |l,i|             
       Article.create!(title: titles[i], url: "https://akhbarak.net"+links[i], image_url: "hhtt" )
    end
    sleep 2
    
   end
end