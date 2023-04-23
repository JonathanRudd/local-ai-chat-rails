require 'openai'
require 'env'

messageArray = ["Greetings Potion Seller"]

def fetch_gpt(messageArray)
  client = OpenAI::Client.new(access_token: gpt_auth)
  response = client.chat(
    parameters: {
        model: "gpt-3.5-turbo", # Required.
        messages: [{"role": "system", "content": "Pretend you are an NPC in a roleplaying game. You are a potion-seller in a generic fantasy setting. You speak in a mysterious and haughty manner.
          In your shop you have a limited stock of potions."}, # Required.
                    {"role": "user", "content": messageArray.last}], # Required.
        temperature: 0.7,
    })
  puts response.dig("choices", 0, "message", "content")
end
