class Crawler
    require 'nokogiri'
    require 'open-uri'
    require 'pry'
    require 'awesome_print'
    doc = Nokogiri::HTML(open('https://akhbarak.net/sections/Egypt'))
    binding.pry
    articles =  doc.search("[@class='media-heading']").to_a

    articles.each do |a|
        a.new(title: a.title, url: a.url, image_url: a.image_url)
    end 
end