# module Crawlers
#     class Crawler 
#         require 'nokogiri'
#         require 'open-uri'
#         require 'byebug'
#         require 'awesome_print'
#         # def initialize()
#         # end
#         # def call()
#             doc = Nokogiri::HTML(open('https://akhbarak.net/sections/Egypt'))
#             links = doc.css("h4.media-heading a").map{|l| l['href']}
#             titles = doc.xpath("//h4/a").map{|t|t.text}
#             links.each_with_index do |l,i|
#                 byebug 
#                 Article.create!(title: titles[i], url: links[i], image_url: "hhtt" )
#             end 
#         # end
      
#     end
        
# end

