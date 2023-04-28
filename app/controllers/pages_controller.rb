class PagesController < ApplicationController
  def home
    @title = "Home"

  end

  require 'openai'


def fetch_gpt(messageArray)
  client = OpenAI::Client.new(access_token: ENV.fetch('OPENAI_ACCESS_TOKEN'))

  messages = [{ "role": "system", "content": "Pretend you are an NPC in a roleplaying game. You are a potion-seller in a generic fantasy setting. You speak in a mysterious and haughty manner.
    In your shop you have a limited stock of potions." }]
  messageArray.each do |message|
    messages << message
  end

  p messages

  response = client.chat(
    parameters: {
        model: "gpt-3.5-turbo", # Required.
        messages: messages,
        temperature: 0.7,
    })
  puts response.dig("choices", 0, "message", "content")
  console.log response.dig("choices", 0, "message", "content")
end





end
