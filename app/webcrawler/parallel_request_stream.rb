require 'benchmark'
require 'typhoeus'
require 'rubygems'
require 'excon'



def multiplos_requests
    hydra = Typhoeus::Hydra.new
    20.times do
        request = Typhoeus::Request.new("www.youtube.com", followlocation: true)
        request.on_body do |response|
        #puts response
        end
    hydra.queue(request)
    end
    hydra.run
end

def single_request_on_typhoeus
    request = Typhoeus::Request.new("www.youtube.com", followlocation: true)
    
    request.on_body do |chunk|
      puts chunk
    end
    request.run
end

def single_request_on_excoon
    connection = Excon.get('http://www.youtube.com')
end

Excon.defaults[:middlewares] << Excon::Middleware::RedirectFollower



puts Benchmark.realtime{multiplos_requests}

puts Benchmark.realtime{single_request_on_typhoeus}
puts Benchmark.realtime{single_request_on_excoon }


