require_relative './config'

Circuitry.subscribe(async: true) do |message, topic|
  puts "Received: #{topic}: #{message.inspect}"
end
