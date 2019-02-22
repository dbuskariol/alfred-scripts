require 'nokogiri'
require 'open-uri'

query = ARGV.join(" ")
abort("Please pass your search term as an argument") if query.nil? || query == ""
query = query.gsub(" ", "+")
url = "https://www.youtube.com/results?search_query=#{query}"
page = Nokogiri::HTML(open(url))   
first_page_links = []

page.css('.yt-lockup-content').each_with_index do |section, index|
    segment = section.css(".yt-uix-tile-link")[0]["href"]
    first_page_links << segment unless segment.include?("googleadservices") || segment.include?("&")
end

selected_link = first_page_links.first
full_link = "https://www.youtube.com/#{selected_link}"
puts full_link