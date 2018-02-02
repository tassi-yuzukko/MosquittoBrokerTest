require "mqtt"

MQTT::Client.connect(host: "localhost",
                     port: 1883,
                     ssl: false) do |client|
  for num in 1..10 do
    client.publish(num.to_s, "a"*220000000, true, 1)
  end
end