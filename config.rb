require 'circuitry'
require 'dotenv'

Dotenv.load

Circuitry.publisher_config do |c|
  c.access_key = ENV.fetch('AWS_ACCESS_KEY')
  c.secret_key = ENV.fetch('AWS_SECRET_KEY')
  c.region     = ENV.fetch('AWS_REGION')

  c.async_strategy = :thread

  c.on_async_exit = proc do
    puts "Publisher done."
  end

  # TODO: replace this with a list of topics that will be published to
  c.topic_names = %W[
    example-circuitry-topic
  ]
end

Circuitry.subscriber_config do |c|
  c.access_key = ENV.fetch('AWS_ACCESS_KEY')
  c.secret_key = ENV.fetch('AWS_SECRET_KEY')
  c.region     = ENV.fetch('AWS_REGION')

  c.async_strategy = :thread

  c.on_async_exit = proc do
    puts "Subscriber done."
  end

  # TODO: rename the queue to something more meaningful for your project
  c.queue_name = 'example-circuitry-queue'

  # TODO: replace this with a list of topics that the queue should subscribe to
  c.topic_names = %W[
    example-circuitry-topic
  ]
end
