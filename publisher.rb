require_relative './config'

topic = 'example-circuitry-topic'

10.times do |n|
  # `object` can be anything that responds to `#to_json`.
  object = { foo: 'bar', fizz: 'buzz', n: n }

  Circuitry.publish(topic, object, async: true)
end

Circuitry.flush
