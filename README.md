# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover: this project about crawling/scraping content from akhbarak
and we can extract those links to a mysql databas

* Ruby version2.6.5 * rails version 6.0.2.1
   

* System dependencies 
   i used this gems 
   - gem 'nokogiri' : for crawl and scrape data 
   - gem 'kaminari' : to apply pagination 
   - gem 'sidekiq' : to apply background jobs that crawl /scrape content from akhbarak
   - gem 'redis' : to  store all of its job and operational data.
   

* Configuration
   Ruby version2.6.5 * rails version 6.0.2.1 *mysql *redis *sidekiq
   
*how to run this project locally:
   - rails s on project directory then use sidekiq to run the back groundjobs it will fill database with articles that you can get it from hit endpoint get 'http://localhost:3000/articles' , you can send query params to spicify the paginations with page and number of articles per page  
   




* ...
