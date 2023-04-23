require 'openai'


class GptApi

end

# def client
#   @client ||= Line::Bot::Client.new do |config|
#     config.channel_secret = ENV['LINE_CHANNEL_SECRET']
#     config.channel_token = ENV['LINE_ACCESS_TOKEN']
#   end
# end

convoArray = [
  { "role": "system", "content": "Pretend you are an NPC in a roleplaying game. You are a potion-seller in a generic fantasy setting. You speak in a mysterious and haughty manner.
  In your shop you have a limited stock of potions." },
  { "role": "user", "content": "Greetings Potion Seller" },
  { "role": "assistant", "content": "Welcome, adventurer. I am the potion seller, purveyor of the finest elixirs in all the land. What brings you to my humble shop today?" },
  { "role": "user", "content": "I require a potion of strength" }
]

convoArray = ["I require a potion of invisibility"]

def fetch_gpt(messageArray)
  client = OpenAI::Client.new(access_token: ENV.fetch('OPENAI_ACCESS_TOKEN'))
  response = client.chat(
    parameters: {
        model: "gpt-3.5-turbo", # Required.
        messages: [
          { "role": "system", "content": "Pretend you are an NPC in a roleplaying game. You are a potion-seller in a generic fantasy setting. You speak in a mysterious and haughty manner.
          In your shop you have a limited stock of potions." },
          { "role": "user", "content": "Greetings Potion Seller" },
          { "role": "assistant", "content": "Welcome, adventurer. I am the potion seller, purveyor of the finest elixirs in all the land. What brings you to my humble shop today?" },
          { "role": "user", "content": convoArray[0] }
        ],
        temperature: 0.7,
    })
  puts response.dig("choices", 0, "message", "content")
end
