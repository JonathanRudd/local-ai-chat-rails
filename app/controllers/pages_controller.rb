class PagesController < ApplicationController
  def home
    @title = "Home"
    # must add POST request to gpt_api.rb call function
    # how can I use the POST request to send the convoArray to the API?


    convoArray = [{ "role": "user", "content": "Greetings Potion Seller" }, { "role": "assistant",
      "content": "Welcome, adventurer. I am the potion seller, purveyor of the finest elixirs in all the land. What
     brings you to my humble shop today?" }, { "role": "user", "content": "I am in need of a potion of healing"} ]

    callGpt = GptApi.fetch_gpt(convoArray)





  end

  # def call(items)
  #   @response = GptApi.fetch_gpt(items)
  # end



end
