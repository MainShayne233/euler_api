require 'HTTParty'
# need to run `gem install HTTParty` if you don't have it already

response = HTTParty.get 'https://projecteulerapi.herokuapp.com/api/problem/1/check/2'
puts response.parsed_response['result']
