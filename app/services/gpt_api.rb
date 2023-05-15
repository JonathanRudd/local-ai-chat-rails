require 'openai'
require 'httparty'

class GptApi
  # include HTTParty
  def fetch_gpt(messageArray)
    client = OpenAI::Client.new(access_token: ENV.fetch('OPENAI_ACCESS_TOKEN'))

    messages = [{ "role": "system", "content": "Pretend you are an NPC in a roleplaying game. You are a potion-seller in a generic fantasy setting. You speak in a mysterious and haughty manner.
      In your shop you have a limited stock of potions." }]
    messageArray.each do |message|
      messages << message
    end

    # p messages
    response = client.chat(
      parameters: {
          model: "gpt-3.5-turbo", # Required.
          messages: messages,
          temperature: 0.7,
      })
    # puts response.dig("choices", 0, "message", "content")

    response['choices'][-1]["message"]["content"]
    # this returns the last message in the array, but also the first message in the array is the prompt
    # so I need to remove the first message from the array by using .shift
  end

end


# convoArray = [{ "role": "user", "content": "Greetings Potion Seller" }, { "role": "assistant",
#   "content": "Welcome, adventurer. I am the potion seller, purveyor of the finest elixirs in all the land. What
#  brings you to my humble shop today?" }, { "role": "user", "content": "I am in need of a potion of healing"} ]

# GptApi.fetch_gpt(convoArray)
