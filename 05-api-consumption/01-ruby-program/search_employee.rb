require "json"
require "rest-client"

puts "What is the name of the employee you're looking for? (e.g. Bob Dylan)"
name = gets.chomp.split # asks user to type something in the Terminal

puts "Ok got it! Let's search for that person..."

# TODO: your code goes here
url = "https://team-building-api.cleverapps.io/v2/employees?first_name=#{name[0]}&last_name=#{name[1]}"
response = RestClient.get(url)
employees = JSON.parse(response.body)

puts "#{employees["employees"][0]["first_name"]} #{employees["employees"][0]["last_name"]} (#{employees["employees"][0]["job_title"]})"
puts "From the team #{employees["employees"][0]["team"]["name"]}"
puts "Working from #{employees["employees"][0]["site"]["name"]}"
