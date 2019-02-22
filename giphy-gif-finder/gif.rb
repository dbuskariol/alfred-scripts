require 'net/http'
require 'json'

api_key = ENV["GIPHY_API_KEY"]
abort("No API key provided") if api_key.nil? || api_key == ""

query = ARGV.join(" ")
abort("Please pass your search term as an argument") if query.nil? || query == ""

query = query.gsub(" ", "+")
url = "http://api.giphy.com/v1/gifs/search?q=#{query}&api_key=#{api_key}&limit=100"
resp = Net::HTTP.get_response(URI.parse(url))
abort("Error talking to the Giphy API") unless resp.code == "200"

buffer = resp.body
result = JSON.parse(buffer)

under_size = result["data"].select do |gif|
    size = gif["images"]["preview"]["mp4_size"].to_i
    gif if size <= 30000 && size >= 15000
end

if under_size.first.nil?
    output = "No gif between 1.5MB and 3MB found with the query: #{query}"
else
    under_size = under_size.first(5)
    id = under_size.sample["id"]
    # output = ".gif #{ARGV.join(" ")}\nhttps://media.giphy.com/media/#{id}/giphy.gif"
    output = "https://media.giphy.com/media/#{id}/giphy.gif"
end

puts output