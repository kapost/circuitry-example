require_relative './config'

Circuitry.subscribe(async: true) do |message, topic_name|
  puts "Received: #{topic}: #{message.inspect}"
end
